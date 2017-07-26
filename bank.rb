class Bank

	def initialize()
		@accounts = []
	end

	attr_accessor :accounts

	def add(account)
		accounts << account
	end

end