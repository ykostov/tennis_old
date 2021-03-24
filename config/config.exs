# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tennis,
  ecto_repos: [Tennis.Repo]

# Configures the endpoint
config :tennis, TennisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dbRNYqUQzgQS8QWO2Y0jbD4AXn0861IhHbwcYyyPHTtXDbIHact+BU4ZTk4clG3+",
  render_errors: [view: TennisWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tennis.PubSub,
  live_view: [signing_salt: "W/wsBk+5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
