// run with `rustc StringToArray.rs && ./StringToArray`
/*
Prompt:

Input: "aaaabbbcca"

Output: [("a", 4), ("b", 3), ("c", 2), ("a", 1)]

Write a function that converts the input to the output.
*/

fn convert(input: &str) -> Box<Option<Vec<(char, u32)>>> {
    if input.len() == 0 {
        return Box::new(None);
    }

    let mut current_char = input.chars().next().unwrap();
    let mut times = 1;
    let mut output: Vec<(char, u32)> = vec![];

    for (index, c) in input.chars().enumerate().skip(1) {
        if input.chars().nth(index).unwrap() == current_char {
            times += 1;
        } else {
            output.push((current_char, times));
            current_char = c;
            times = 1;
        }
    }
    output.push((current_char, times));

    if output.len() > 0 {
        Box::new(Some(output))
    } else {
        Box::new(None)
    }
}

fn main() {
    println!("{:?}", convert("aaaabbbcca"));
    println!("{:?}", convert("aaaaaaaaba"));
    println!("{:?}", convert("         "));
    println!("{:?}", convert(""));
}
