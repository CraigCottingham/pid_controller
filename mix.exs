defmodule PidController.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :pid_controller,
      version: "0.1.3",
      name: "PidController",
      description: description(),
      source_url: "http://github.com/CraigCottingham/pid_controller",
      homepage_url: "http://github.com/CraigCottingham/pid_controller",
      package: package(),
      elixir: "~> 1.9",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [espec: :test],
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {PidController.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      ci_test: ["espec"],
      credo: ["credo --strict"],
      test: ["format", "credo --strict", "dialyzer", "espec"]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:espec, "~> 1.9", only: :test},
      {:ex_doc, "~> 0.29.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp description, do: "A PID (proportional/integral/derivative) controller in Elixir."

  defp elixirc_paths(:test), do: ["lib", "spec/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/CraigCottingham/pid_controller"}
    ]
  end
end
