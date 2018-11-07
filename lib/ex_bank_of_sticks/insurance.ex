defmodule ExBankOfSticks.Insurance do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, %{}, [name: :insurance] ++ args)
  end

  def store(ledger) do
    GenServer.cast(:insurance, {:store, ledger})
  end

  def get do
    GenServer.call(:insurance, {:get})
  end

  def init(_args) do
    {:ok, %{}}
  end

  def handle_cast({:store, ledger}, _current_ledger) do
    {:noreply, ledger}
  end

  def handle_call({:get}, _requester, ledger) do
    {:reply, ledger, ledger}
  end
end
