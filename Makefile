all: run_backend & run_frontend

run_backend:
	cd backend && gleam run

run_frontend:
	cd frontend && gleam run -m lustre/dev start


