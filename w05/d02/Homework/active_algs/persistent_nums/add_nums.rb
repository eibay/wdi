require_relative "./connection"
require_relative "./num"

if Num.last
	Num.database_exists
else
	30.times do
		value = rand(0..100000)
		num = Num.new({value: value})
		num.save
	end
end