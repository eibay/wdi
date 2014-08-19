class Cleaver

	attr_accessor :header, :params

	def initialize(params, header) 
		@header = header
		@params = params
	end

	def self.parse(client)
		request_header = ''
		content_length_line = ''
		i = 0
		while i < 11
			line = client.gets 
			if line.include?("Content-Length")
				content_length_line = line
			end
 			request_header += line
 			i += 1
		end
		content_length = content_length_line.split(' ')[1].to_i
		params = {}
		params_string = client.read(content_length).split('&').each do |el|
			params_arr = el.split('=')
			params[params_arr[0].to_sym] = params_arr[1]
		end

		instance = new(params, request_header)

		return instance
	end

end
