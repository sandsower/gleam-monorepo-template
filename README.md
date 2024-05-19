# Gleam Monorepo Template - Lustre & Mist
This is a template to be used for bootstrapping fresh Gleam monorepos, using Lustre for the frontend and Mist for the backend. Here's how the structure of this template looks: 

```
├── backend
│   ├── build
│   ├── gleam.toml
│   ├── manifest.toml
│   ├── README.md
│   ├── src
│   └── test
├── frontend
│   ├── build
│   ├── gleam.toml
│   ├── index.html
│   ├── manifest.toml
│   ├── priv
│   ├── README.md
│   ├── src
│   └── test
├── Makefile
├── packages
│   └── example
└── README.md
```
## backend

The backend is setup to be as minimal as possible. However it does include [radiant](https://github.com/pta2002/gleam-radiate) to allow for hmr on backend changes involving gleam files. Target is set to run on the erlang VM.

### Requirements

You'll need to have the erlang VM installed and rebar3 for the backend to work, as well as inotify-tools for hmr support.

## frontend

The frontend is setup to use lustre as the frontend framework. This is setup with minimal configuration, fully customizable. Target is set to run on javascript.

### Requirements

You'll need to have node installed (preferrably v20+) for the frontend, as well as inotify-tools for hmr support.

## packages

The packages folder should include code for modules that are not strictly part of either backend or frontend. Ideally code should be separated on it's own folders and then imported on whichever part of the codebase needs it.

Each part of the project itself is setup with it's own README and more detailed instructions there.

## Running the monorepo

You can use the commands in the Makefile to run either the backend or the frontend with `make run-backend` or `make run-frontend` respectively. Support for concurrent runs of both is upcoming.

## TODO

- Create a Dockerfile
- Add documentation for deployment
- Create scripts for bootstrapping (rename projects, change configuration files automatically)
- Add support for concurrent runs
