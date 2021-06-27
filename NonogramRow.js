// Challenge name: Nonogram row
// Challenge link: https://www.reddit.com/r/dailyprogrammer/comments/o4uyzl/20210621_challenge_395_easy_nonogram_row/
// Completed by Zack Sargent on: June 26th, 2021
// Resources: None

"use strict";

function nonogramrow(arr) {
	let result = [];
	let counter = 0;
	for (let ele of arr) {
		if (ele === 1) {
			counter++;
		} else {
			if (counter > 0)
				result.push(counter);
			counter = 0;
		}
	}
	if (counter > 0)
		result.push(counter);
	return result;
}

function assert(real, expected) {
	console.log(JSON.stringify(real) === JSON.stringify(expected));
}

assert(nonogramrow([]), []);
assert(nonogramrow([0,0,0,0,0]), []);
assert(nonogramrow([1,1,1,1,1]), [5]);
assert(nonogramrow([0,1,1,1,1,1,0,1,1,1,1]), [5,4]);
assert(nonogramrow([1,1,0,1,0,0,1,1,1,0,0]), [2,1,3]);
assert(nonogramrow([0,0,0,0,1,1,0,0,1,0,1,1,1]), [2,1,3]);
assert(nonogramrow([1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]), [1,1,1,1,1,1,1,1]);

