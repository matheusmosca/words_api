defmodule Words.MixProject do
  use Mix.Project

  def project do
    [
      app: :words,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Words.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.6.6"},
      {:postgrex, ">= 0.0.0"},
      {:swoosh, "~> 1.3"},
      {:gettext, "~> 0.18"},
      {:hackney, ">= 1.18.0"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
