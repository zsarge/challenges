// Challenge name: [2/16/2012] Challenge #8 [easy]
// Challenge link: https://www.reddit.com/r/dailyprogrammer/comments/pserp/2162012_challenge_8_easy/
// Completed by Zack Sargent on: {date}
// Notes: This was more to get familiar with rust, rather than to solve a hard problem.
// Resources: https://lyricsplayground.com/alpha/songs/numbers/99bottlesofbeeronthewall.html

#![allow(non_snake_case)]

fn plural(i: i32) -> &'static str {
    match i {
        1 => return "",
        _ => return "s",
    }
}

fn main() {
    for i in (1..100).rev() {
        let s: &str = plural(i);

        println!("{0} bottle{1} of beer on the wall,", i, s);
        println!("{0} bottle{1} of beer!", i, s);
        println!("Take one down,");
        println!("Pass it around,");
        println!("{0} bottle{1} of beer on the wall!", i - 1, plural(i - 1));
        println!("");
    }
}
