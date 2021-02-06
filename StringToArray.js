// Challenge name: Fun with an interview question
// Challenge link: https://danielbmarkham.com/fun-with-an-interview-question/
// Completed by Zack Sargent on: Feb. 6th, 2021

// this was done before I did it in Python.
// see ./StringToArray.py for the Python version.

/*
Prompt:

Input: "aaaabbbcca"

Output: [("a", 4), ("b", 3), ("c", 2), ("a", 1)]

Write a function that converts the input to the output.
*/

const inputString = "aaaabbbcca";

function makeArray(input) {
	let currentChar = input[0],
		times = 1,
		output = [];

	for (let i = 1; i <= input.length; i++) {
		if (input[i] === currentChar) {
			times++;
		} else {
			output.push([currentChar, times]);
			currentChar = input[i];
			times = 1;
		}
	}
	return output;
}

function formatAsTuples(array) {
	let string = JSON.stringify(array);
	string = string.replace(/\[/g, "(");
	string = string.replace(/\]/g, ")");
	string = string.replace(/\)\)/g, ")]");
	string = string.replace(/\(\(/g, "[(");
	string = string.replace(/,/g, ", ");

	return string;
}

console.log(formatAsTuples(makeArray(inputString)));

// This problem would have been better solved in a language with tuples.
