class User < ActiveRecord::Base
	# Table settings
	set_table_name "user" 
	set_primary_key "username"

	# Associations
	# It's called associated_person rather than person because the attribute
	# name should be different from the foreign key. Otherwise, we could not
	# distinguish between accesses to the attribute and to the key.
	# TODO rename to the_person, consistent with Flight
	belongs_to :associated_person, :class_name => "Person", :foreign_key => 'person'

	# Additional (non-database) fields
	attr_accessor :current_password

	# Default validations
	validates_presence_of   :username,                                :message   => "darf nicht leer sein" # length will also count blanks
	validates_uniqueness_of :username, :case_sensitive => false,      :message   => "existiert schon"
	validates_length_of     :username, :minimum => 2,                 :too_short => "muss mindestens {{count}} Zeichen lang sein"
	validates_format_of     :username, :with => /^[a-zA-Z0-9_.-]*$/,  :message   => "Der Benutzername darf nur Buchstaben, Ziffern, _, . und - enthalten"
	# TODO don't allow the name of the sk_admin

	# Password validation
	# On creation, we always require a password to be present. Otherwise, we
	# require that the password not be blank *if* it is present at all. That
	# way, we can have an edit form without password fields, but if there is a
	# password field (e. g. on the change password page), it must be specified.
	# In any case, if a password is given, it must match the confirmation.
	validates_presence_of     :password, :on => :create,     :message => "darf nicht leer sein"
	validates_presence_of     :password, :allow_nil => true, :message => "darf nicht leer sein"
	validates_confirmation_of :password,                     :message => "stimmt nicht mit Bestätigung überein"

	# Human names for attributes
	attr_human_name :username         => 'Benutzername'
	attr_human_name :current_password => 'Altes Passwort'
	attr_human_name :password         => 'Passwort'

	# Callbacks
	# If a password confirmation is given, a password is also given and must be
	# hashed before saving. If no password confirmation is given, no password
	# was given either, and the password attribute was not changed. In this
	# case, it contains the hash and will not be hashed.
	before_save :hash_password!, :if => :password_confirmation_given?


	def self.authenticate(username, password)
		User.exists? 'username'=>username, 'password'=>mysql_password_hash(password)
	end

	def clear_passwords
		self.password=nil
		self.password_confirmation=nil
		self.current_password=nil
	end

	def has_permission?(permission)
		send "perm_#{permission}"
	end

protected
	def hash_password!
		self.password = mysql_password_hash(self.password)
	end

	def password_confirmation_given?
		!password_confirmation.nil?
	end
end

