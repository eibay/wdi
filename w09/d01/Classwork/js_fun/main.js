function inArray(ary, num) {
	for(var i=0;i<ary.length;i++) {
		if (ary[i]==num) {
			return true;
		};
	};

	for(var i=0;i<ary.length;i++) {
		if (ary[i]!=num) {
			return false;
		};
	};
};

console.log(inArray([1,2,3],6));