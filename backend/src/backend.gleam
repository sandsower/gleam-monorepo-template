import example
import gleam/bytes_builder
import gleam/erlang/process
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import gleam/result
import mist.{type Connection, type ResponseData}
import radiate

pub fn main() {
  let _ =
    radiate.new()
    |> radiate.add_dir("src")
    |> radiate.add_dir("../packages")
    |> radiate.start()

  let not_found =
    response.new(404)
    |> response.set_body(mist.Bytes(bytes_builder.new()))

  let assert Ok(_) =
    fn(req: Request(Connection)) -> Response(ResponseData) {
      case request.path_segments(req) {
        ["hello"] -> hello(req)

        _ -> not_found
      }
    }
    |> mist.new
    |> mist.port(3000)
    |> mist.start_http

  process.sleep_forever()
}

fn hello(request: Request(Connection)) -> Response(ResponseData) {
  let content_type =
    request
    |> request.get_header("content-type")
    |> result.unwrap("application/json")

  response.new(200)
  |> response.set_body(
    mist.Bytes(bytes_builder.from_string(example.hello_world())),
  )
  |> response.set_header("content-type", content_type)
  |> response.set_header("x-powered-by", "Gleam")
  |> response.set_header("Access-Control-Allow-Origin", "*")
}
