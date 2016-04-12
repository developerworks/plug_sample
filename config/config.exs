use Mix.Config

config :logger, :console,
  level: :debug,
  format: "$date $time $metadata[$level] $message\n"
