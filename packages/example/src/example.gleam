import gleam/io
import gleam/json.{object}

pub fn main() {
  io.print(hello_world())
}

pub fn hello_world() {
  "Hello world!" |> json_result_encode
}

pub fn json_result_encode(s: String) {
  object([#("result", json.string(s))]) |> json.to_string
}
