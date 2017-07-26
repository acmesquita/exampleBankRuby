require 'highline/import'

load 'client.rb'
load 'account.rb'
load 'bank.rb'
load 'record.rb'

clients = []
bank = Bank.new


loop do

	choose do |menu|
		system("clear")
		puts "------ Bank -----"
		puts
		menu.prompt = "Choose an option:"
		
		menu.choice(:create_account){
			system("clear")
			puts "----- Create new account -----"
			puts
			name = ask "Name: "
			document = ask "Document:"

			client = Client.new({name:name, document:document})
			clients << client
			client.id = clients.length

			puts "-- Account --"
			puts

			type = ask("Type:") { |q| q.default = "Checking account" }
			value = ask "Opening Balance:", Float

			account = Account.new({type: type, client:client, balance:value})
			bank.add(account)

			say "Account create with success!"

			ask "return?"
		}
		
		menu.choice(:acess_my_account){
			system("clear")
			document = ask "Say your document"

			account = bank.accounts.select { |account| account.client.document == document  }.first

			if account
				ask "No account found."
			else
				system("clear")
				puts "----- Account -----"
				puts
				puts "Hello, #{account.client.name} - document: #{account.client.document}"
				puts 
				puts "#{account.type}"
				puts 
				puts "Balance: $ #{account.balance}"
				puts
				puts
				choose do |menu|
					menu.prompt = "Choose an option:"
					menu.choice(:deposit){
						system("clear")
						puts "---- Deposit ----"
						puts
						value = ask "How much will the deposit be?"
						account.deposit(value)
						say "Deposit create success."
						ask "return?"
					}
					menu.choice(:transfir){

					}
					menu.choice(:cash_out){

					}
					menu.choice(:exit){exit}
				end
			end

			#depositar
			#transferir
			#sacar
		}
		
		menu.choice(:exit){exit}
		
		menu.default = :create_account
	end
end