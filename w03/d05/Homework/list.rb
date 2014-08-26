def list
	admitted = " "
	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |x|
		admitted += "<li>On #{x["date"]} #{x["fName"]} #{x["lName"]} was admitted with #{x["condition"]} and assigned to #{x["doc"]}.</li>"
	end
return admitted
end