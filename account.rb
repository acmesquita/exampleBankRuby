require 'date'

load 'record.rb'


class Account

	def initialize (options = {})
		@id = options[:id]
		@type = options[:type]
		@client = options[:client]
		@balance = options[:balance]
		@number = options[:number]
		@records = []
	end

	def to_s
		number.to_s + " (" + type.to_s + ") - " + client.name.to_s + " - " + client.document.to_s + " - $" + balance.to_s
	end

	attr_accessor :id, :type, :client, :balance, :records, :number

	def transfer(account, value_tranfer)
		if self.cash_out(value_tranfer)
			account.deposit(value_tranfer)
			records << Record.new({origin:self, destiny: account, value:value_tranfer, date:Date.today, type:"T"})
		end
	end

	def deposit(value)
		self.balance += value
		records << Record.new({origin:self, destiny: self, value:value, date:Date.today, type:"D"})
	end

	def cash_out(value)
		if self.balance > value
			self.balance -= value
			records << Record.new({origin:self, destiny: self, value:value, date:Date.today, type:"C"})
			return true
		end
		return false
	end	

	def show_statement
		self.records.each{ |r| puts r.to_s}
	end
end

