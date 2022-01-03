
fn find(target: i32, current: i32, history: String) -> Option<String> {
    if current == target {
        return Some(history);
    } else if current > target {
        return None;
    } else {
        let a = find(target, current + 5, format!("({} + 5)", history));
        let b = find(target, current * 3, format!("({} * 3)", history));

        match (a, b) {
            (Some(a), _) => Some(a),
            (_, Some(b)) => Some(b),
            (None, None) => None
        }
    }

}

fn find_solution(target: i32) -> String {
    match find(target, 1, "1".to_string()) {
        Some(x) => x,
        None => "no solution".to_string()
    }
}

fn main() {
    println!("{}", find_solution(253));
}

