load 'record.rb'


class Account

	def initialize (options = {})
		@id = options[:id]
		@type = options[:type]
		@client = options[:client]
		@balance = options[:balance]
		@records = []
	end

	attr_accessor :id, :type, :client, :balance, :records

	def transfer(account, value_tranfer)
		self.balance -= value_tranfer
		account.balance += value_tranfer
		record.new({origin:self, destiny: account, value:valor_tranfer, date:Date.today})
	end

	def deposit(value)
		self.balance += value
	end

	def cash_out(value)
		if balance > value
			balance -= value
		end
	end	
end

