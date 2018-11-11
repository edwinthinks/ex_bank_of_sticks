defmodule FlammableElixirBank.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_bank_of_sticks,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {FlammableElixirBank.Application, []}
    ]
  end

  defp deps do
    []
  end

end
