import example
import gleam/erlang/process
import gleam/http.{Get}
import gleam/string_builder
import mist
import radiate
import wisp.{type Request, type Response}

pub fn main() {
  let _ =
    radiate.new()
    |> radiate.add_dir("src")
    |> radiate.add_dir("../packages")
    |> radiate.start()

  wisp.configure_logger()
  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp.mist_handler(handle_request, secret_key_base)
    |> mist.new
    |> mist.port(3000)
    |> mist.start_http

  process.sleep_forever()
}

pub fn handle_request(req: Request) -> Response {
  use req <- middleware(req)

  case wisp.path_segments(req) {
    // This matches `/` and `/hello`.
    [] | ["hello"] -> hello(req)

    // This matches all other paths.
    _ -> wisp.not_found()
  }
}

fn hello(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let json = string_builder.from_string(example.hello_world())
  wisp.ok()
  |> wisp.set_header("content-type", "application/json")
  |> wisp.set_header("Access-Control-Allow-Origin", "*")
  |> wisp.json_body(json)
}

pub fn middleware(
  req: wisp.Request,
  handle_request: fn(wisp.Request) -> wisp.Response,
) -> wisp.Response {
  let req = wisp.method_override(req)
  use <- wisp.log_request(req)
  use <- wisp.rescue_crashes
  use req <- wisp.handle_head(req)

  handle_request(req)
}
