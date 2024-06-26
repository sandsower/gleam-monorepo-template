# Gleam Monorepo Template - Lustre & Wisp
This is a template to be used for bootstrapping fresh Gleam monorepos, using Lustre for the frontend and Wisp for the backend. Here's how the structure of this template looks: 

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

## frontend

The frontend is setup to use lustre as the frontend framework. This is setup with minimal configuration, fully customizable. Target is set to run on javascript.

## packages

The packages folder should include code for modules that are not strictly part of either backend or frontend. Ideally code should be separated on it's own folders and then imported on whichever part of the codebase needs it.

Each part of the project itself is setup with it's own README and more detailed instructions there.

=====================================

### Requirements

You'll need to have the erlang VM installed and rebar3 for both the backend and frontend to work, as well as inotify-tools for hmr support.

## Running the monorepo

You can use the commands in the Makefile to run either the backend or the frontend with `make run-backend` or `make run-frontend` respectively. Support for concurrent runs of both is upcoming.

**Looking for a leaner Gleam fullstack solution?** 
Check out the [Gleam Nakai HTMX Template](https://github.com/sandsower/htmx-nakai-template) ! It's setup to use Wisp for the backend with all the frontend being served as HTMX-powered HTML directly 

## TODO

- Create a Dockerfile
- Add documentation for deployment
- Create scripts for bootstrapping (rename projects, change configuration files automatically)
- Add support for concurrent runs
