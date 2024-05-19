import gleam/dynamic
import gleam/option.{type Option, None, Some}
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import lustre_http.{type HttpError}

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn init(_flags) -> #(Model, Effect(Msg)) {
  #(Model(hello: None), effect.none())
}

type Model {
  Model(hello: Option(HelloWorld))
}

type HelloWorld {
  HelloWorld(text: String)
}

pub opaque type Msg {
  UserEnteredSite
  ApiFetchedHello(Result(HelloWorld, HttpError))
}

fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    UserEnteredSite -> #(model, get_hello_world())
    ApiFetchedHello(Ok(text)) -> #(Model(hello: Some(text)), effect.none())
    ApiFetchedHello(Error(_)) -> #(model, effect.none())
  }
}

fn get_hello_world() -> Effect(Msg) {
  let url = "http://localhost:3000/hello"
  let decoder =
    dynamic.decode1(HelloWorld, dynamic.field("result", dynamic.string))

  lustre_http.get(url, lustre_http.expect_json(decoder, ApiFetchedHello))
}

fn view(model: Model) -> Element(Msg) {
  let styles = [#("width", "100vw"), #("height", "100vh"), #("padding", "1rem")]
  case model.hello {
    Some(HelloWorld(text)) ->
      html.body([attribute.style(styles)], [
        html.div([], [
          html.h1([], [element.text(text)]),
          html.h2([], [element.text("Welcome to Lustre.")]),
        ]),
      ])
    None ->
      html.div([], [
        html.button([event.on_click(UserEnteredSite)], [element.text("Enter")]),
      ])
  }
}
