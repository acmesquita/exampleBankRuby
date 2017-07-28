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
		menu.choice(:list_accounts){
			bank.accounts.each {|account| puts account}
			ask "return"
		}
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

			account = Account.new({type: type, client:client, balance:value, number:rand(1...1000)})
			bank.add(account)

			say "Account create with success! Number of your account: #{account.number}"

			ask "return?"
		}
		
		menu.choice(:acess_my_account){
			system("clear")
			number = ask "Number account:"

			account = bank.accounts.select { |account| account.number.eql? number.to_i  }.first

			if account
				system("clear")
				puts "----- Account -----"
				puts
				puts "Hello, #{account.client.name} - document: #{account.client.document}"
				puts 
				puts "#{account.type} - number: #{account.number}"
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
						account.deposit(value.to_f)
						say "Successful."
						ask "return?"
					}
					menu.choice(:transfir){

						system("clear")
						puts "---- Transfir ----"
						puts
						numberAccountDestiny = ask "Number of the account destiny:"
						value = ask "How much will the transfir be?"
						
						accountDestiny = bank.accounts.select{ |a| a.number.eql? numberAccountDestiny.to_i}.first

						if (!accountDestiny.nil?)
							account.transfer(accountDestiny, value.to_f);
							say "Successful."
						else
							say "Account Destiny not found."
						end
						ask "return?"

					}
					menu.choice(:cash_out){
						system("clear")
						puts "---- Cash Out ----"
						puts
						value = ask "How much will the cash out be?"
						account.cash_out(value.to_f)
						say "Successful."
						ask "return?"
					}
					menu.choice(:bank_statement){
						system("clear")
						puts "----- Bank Statement -----"
						puts
						puts "#{account.client.name} - document: #{account.client.document}"
						puts 
						puts "#{account.type} - number: #{account.number}"
						puts 
						puts "Balance: $ #{account.balance}"
						puts
						puts
						account.show_statement
						ask "return?"
					}
					menu.choice(:exit){ask "Are you sure?"}
				end
			else
				ask "No account found, return?"
			end

			#depositar
			#transferir
			#sacar
		}
		
		menu.choice(:exit){exit}
		
		menu.default = :create_account
	end
end