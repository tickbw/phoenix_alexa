defmodule PhoenixAlexa.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.strip

  def project do
    [app: :alexa,
     version: @version,
     elixir: "~> 1.2",
     description: "Alexa library for Phoenix",
     deps: deps,
     package: package,
     consolidate_protocols: Mix.env != :test]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:poison, "~> 2.0"},
     {:plug, "~> 1.1"},
    ]
  end

  defp package do
    [files: ~w(lib test mix.exs README.md LICENSE UNLICENSE VERSION),
     maintainers: ["Gabi Zuniga"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/gabiz/phoenix_alexa"}]
  end
end
