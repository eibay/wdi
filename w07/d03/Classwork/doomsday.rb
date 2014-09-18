require 'pry'
require 'date'

	def dayOfTheWeek(year, month, day)

		year=year.to_i
		day=day.to_i
		month=Date::MONTHNAMES.index(month)
		ordinal=Date.new(y=year,m=month,d=day).yday  
		
		
		if(year % 4==0)&&(year % 100 !=0)||(year % 400==0)
			leap= true
		else
			leap= false
		end

		round_down=year.to_s
		round_down=round_down[0..-3]
		round_down="#{round_down}00"
		round_down=round_down.to_i
		last_two=year.to_s[2..3]
		last_two=last_two.to_i
		if(1800-round_down==0)||(1800-round_down==400)
			anchor= 5
		elsif(1900-round_down==0)||(1900-round_down==400)
			anchor= 3
		elsif(2000-round_down==0)||(2000-round_down==400)
			anchor= 2
		elsif(2100-round_down==0)||(2100-round_down==400)
			anchor= 0
		end

		year_floor=last_two/12
		year_remainder=last_two%12
		remainder_floor=year_remainder/4
		sum=year_floor+year_remainder+remainder_floor

		if(sum%7==0)
			doomsday=anchor
		elsif(sum%7==1)
			doomsday=anchor+1
		elsif(sum%7==2)
			doomsday=anchor+2
		elsif(sum%7==3)
			unless(anchor==5)
				doomsday=anchor+3
			else
				doomsday==(anchor+3)%7
			end
		elsif(sum%7==4)
			unless(anchor==5)||(anchor==3)
				doomsday=anchor+4
			else
				doomsday=(anchor+4)%7
			end
		elsif(sum%7==5)
			if(anchor==0)
				doomsday=anchor+5
			else
				doomsday=(anchor+5)%7
			end
		elsif(sum%7==6)
			if(anchor==0)
				doomsday=anchor+6
			else
				doomsday=(anchor+6)%7
			end
		end
		
		if leap==true
				days_apart=ordinal-4
			else
				days_apart=ordinal-3
			end
			day_of_the_week=((days_apart%7)+doomsday)%7
			if(day_of_the_week==0)
				return "Sunday"
			elsif(day_of_the_week==1)
				return "Monday"
			elsif(day_of_the_week==2)
				return "Tuesday"
			elsif(day_of_the_week==3)
				return "Wednesday"
			elsif(day_of_the_week==4)
				return "Thursday"
			elsif(day_of_the_week==5)
				return "Friday"
			elsif(day_of_the_week==6)
				return "Saturday"
			end
end
binding.pry



