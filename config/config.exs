# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wordyuk,
  ecto_repos: [Wordyuk.Repo]

config :wordyuk, Wordyuk.UserManager.Guardian,
  issuer: "wordyuk",
  secret_key: "DWucmCvk9vVHOQdQHGMqrPA6hlG0SbvaWFPQvRzGqjlx8xnSUgnX/ufehtbvaxf6"

# Configures the endpoint
config :wordyuk, WordyukWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VYjNsA6cG5Es5qRrIZqEjIcWSUZHzPXvuxrz+Y/dP29VOusx4+zqj1zTviu90g/5",
  render_errors: [view: WordyukWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wordyuk.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
