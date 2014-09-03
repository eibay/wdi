require 'active_record'

if Number.all.length > 0 
	Number.delete_all
else
	put "empty"
end