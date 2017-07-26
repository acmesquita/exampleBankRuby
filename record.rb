class Record

	def initialize (options = {})
		@origin = options[:origin]
		@destiny = options[:destiny]
		@value = options[:value]
		@date = options[:date]
	end

	attr_accessor :origin, :destiny, :value, :date

end