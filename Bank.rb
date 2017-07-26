class Bank

	def initialize (options = {})
		@accounts = options[:accounts]
	end

	attr_accessor :accounts

end