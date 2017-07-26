class Account

	def initialize (options = {})
		@id = options[:id]
		@type = options[:type]
		@client = options[:client]
	end

	attr_accessor :id, :type, :client
end