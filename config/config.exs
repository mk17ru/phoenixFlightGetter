# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :project,
  ecto_repos: [Project.Repo]

# Configures the endpoint
config :project, ProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vSSU6rwqh/ShlXhCEqcHRN9DNorhevG3qjdL40zAS8qwh10NHDD9M16noRdWZl0W",
  render_errors: [view: ProjectWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Project.PubSub,
  live_view: [signing_salt: "hJqRDjaq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
