function each(array, someThing) {
	ind = 0;
	while (ind < array.length) {
		someThing(array[ind]);
		ind = ind +1;
	};
};

