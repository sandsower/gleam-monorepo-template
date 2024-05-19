# Gleam Monorepo Template

This is an example of how a gleam monorepo could be structure. The project structure is as follows:
```
├── backend
│   ├── gleam.toml
│   ├── README.md
│   ├── src
│   └── test
├── frontend
│   ├── gleam.toml
│   ├── README.md
│   ├── src
│   └── test
├── packages
│   ├── gleam.toml
│   ├── README.md
│   ├── src
│   └── test
└── README.md
```
## backend

The backend is setup to be as minimal as possible. However it does include [radiant](https://github.com/pta2002/gleam-radiate) to allow for hmr on backend changes involving gleam files. Target is set to run on the erlang VM.

## frontend

The frontend is setup to use lustre as the frontend framework. This is setup with minimal configuration, fully customizable. Target is set to run on javascript.

## packages

The packages folder should include code for modules that are not strictly part of either backend or frontend. Ideally code dealing with models and structures should be saved here to minimize code duplication.

Each part of the project itself is setup with it's own README and more detailed instructions there.
