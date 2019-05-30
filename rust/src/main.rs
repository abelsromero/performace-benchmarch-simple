use std::time::SystemTime;

fn main() {
    let now = SystemTime::now();

    println!("Hello, world!");

    let values = ["1", "dos", "3"];

    for it in values.iter() {
        println!("{}", it);
    }
    // consumes 05MB RAM, but is not very fast
    let mut value: u32 = 1;
    while value < 1_000_000 {
        println!("{}", value);
        value += 1;
        if value == std::u32::MAX {
            value = 0;
        }
    }
    println!(
        "Time: {} sec",
        now.elapsed().unwrap().as_millis() as f32 / 1000.0
    );
}

/*
fn create_vector(size: u32) {
    let mut data = Vec::new();
    for i in 0..size {
        data.push(format!("{} - {}", "012345678901234567890", i));
    }
}
*/
