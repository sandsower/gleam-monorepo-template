import example
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  example.hello_world()
  |> should.equal("{\"result\": \"Hello world!\"}")
}
