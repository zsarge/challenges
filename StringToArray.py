
# Challenge name: Fun with an interview question
# Challenge link: https://danielbmarkham.com/fun-with-an-interview-question/
# Completed by Zack Sargent on: Feb. 6th, 2021

# this was done after I did it in JavaScript.
# see ./StringToArray.js for the Javascript version.

"""
Prompt:

Input: "aaaabbbcca"

Output: [("a", 4), ("b", 3), ("c", 2), ("a", 1)]

Write a function that converts the input to the output.
"""

def make_array(chars: str):
    currentChar = chars[0]
    times = 1
    output = []

    for char in chars[1:]:
        if char == currentChar:
            times += 1
        else:
            output.append((currentChar, times))
            currentChar = char
            times = 1

    output.append((currentChar, times))
    return output

def format_array(array: list) -> str:
    return str(array).replace("'", '"')

print(format_array(make_array("aaaabbbcca")))

# ok so maybe this person just wanted a solution in F#
