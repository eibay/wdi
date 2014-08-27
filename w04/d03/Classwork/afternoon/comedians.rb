require_relative "./comedian"

comedians = [ mitch = Comedian.new("Mitch", 37, "I used to do drugs. I still do, but I used to, too."),
			  louie = Comedian.new("Richard", 50, "I had to stop drinking, cause I got tired of waking up in my car driving 90."),
			  tommy = Comedian.new("Tommy", 40, "I’m on a whiskey diet…I’ve lost three days already.")]

comedians.each { |comedian| comedian.tell_joke }
