def format_duration(seconds, include_seconds)
	seconds=seconds.to_i

	s=(seconds/1)%60
	m=(seconds/60)%60
	h=(seconds/3600)

	if include_seconds
		sprintf("%d:%02d:%02d", h, m, s)
	else
		sprintf("%d:%02d"     , h, m   )
	end
end

class String
	def to_b
		match(/^(true|t|yes|y|1)$/i) != nil
	end
end

class NilClass
	def to_b
		false
	end
end

