/* Check to see if there is a way to make a number with only (*3) or (+5)
 */

"use strict";

function findSolution(target) {
	function find(current, history) {
		if (current == target) {
			return history;
		} else if (current > target) {
			return null;
		} else {
			return find(current + 5, `(${history} + 5)`) ||
				find(current * 3, `(${history} * 3)`);
		}
	}
	return find(1, "1") || "no solution";
}

console.log(findSolution(253))

