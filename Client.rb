class Client

	def initialize (options = {})
		@id = options[:id]
		@name = options[:name]
		@document = options[:document]
	end

	attr_accessor :id, :name, :document

	
end