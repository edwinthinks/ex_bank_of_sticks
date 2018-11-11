defmodule FlammableElixirBank.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {FlammableElixirBank.Insurance, []},
      {FlammableElixirBank.Bank, []}
    ]

    opts = [strategy: :one_for_one, name: FlammableElixirBank.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
