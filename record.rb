class Record

	def initialize (options = {})
		@origin = options[:origin]
		@destiny = options[:destiny]
		@value = options[:value]
		@date = options[:date]
		@type = options[:type]
	end

	attr_accessor :origin, :destiny, :value, :date, :type

	def to_s
		type.to_s + "  " + date.to_s + " " + origin.name + "  " + destiny.name + "  $ "+value.to_s 	
	end
end