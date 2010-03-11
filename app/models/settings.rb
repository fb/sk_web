class Settings
	include Singleton

	Filename=Rails.root.join('config', 'sk_web.yml')

	attr_accessor :location
	attr_accessor :local_addresses

	def initialize
		if (File.exist? Filename)
			yaml=YAML.load(ERB.new(File.new(Filename).read).result)
			config=yaml['config']

			@location        = config['location']
			@local_addresses = config['local_addresses']
		end

		@location        ||= "???"
		@local_addresses ||= []
	end

	# address is an array of 4 strings
	def address_matches(spec, address)
		(0..3).all? { |i| spec[i]=='*' || spec[i]==address[i] }
	end

	# address is a string
	def address_is_local?(address)
		@local_addresses.any? { |spec| address_matches spec.strip.split('.'), address.strip.split('.') }
	end
end

