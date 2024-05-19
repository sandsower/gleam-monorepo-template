# example

This is an example of how you can structure each package in the packages folder. This way you can easily publish the package and keep separate while also being able to use it in the monorepo itself.

You can publish it and add it to the monorepo back like so:
```sh
gleam add example
```
```gleam
import example

pub fn main() {
  // TODO: An example of the project in use
}
```

Or you can modify the import in the other projects to use it with a relative route. Check out the configuration on backend and frontend for an example of how this is being used.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
