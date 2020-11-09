use Mix.Config

# Configure your database
config :orders, Orders.Repo,
  username: "root",
  password: "",
  database: "orders_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :orders_web, OrdersWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
