require "pry"

def countr(string, alphabet)
	bank = []
	bank[0] = nil
	"a".upto("z"){|letter| bank << letter}
	list = string.split("")
	total = 0
	list.each{|letter| total += bank.index(letter)}
	total
end
