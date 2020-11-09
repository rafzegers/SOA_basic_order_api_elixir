# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :orders,
  ecto_repos: [Orders.Repo]

config :orders_web,
  ecto_repos: [Orders.Repo],
  generators: [context_app: :orders]

# Configures the endpoint
config :orders_web, OrdersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fUtF+CcO11HFIBFcZ6NsN9f59XQUcAnmxL8msamWxXI495hcT1AW9GUiZ07NQiUT",
  render_errors: [view: OrdersWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OrdersWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "sCcYyfLN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
