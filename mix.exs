defmodule PlugSample.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_sample,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger],
     mod: {PlugSample, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.1"}
    ]
  end
end
