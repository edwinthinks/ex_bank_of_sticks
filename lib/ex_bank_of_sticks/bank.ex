defmodule ExBankOfSticks.Bank do
  use GenServer

  def start_link(args) do
    # Enable process of a single Teller process under the 
    # atom :teller. Not interested at the moment for multiple
    # tellers.
    GenServer.start_link(__MODULE__, %{}, [name: :bank] ++ args)
  end

  # Bare minimun implementation. I purposely excluded GenServer client side
  # validations.

  def create_account(account, starting_balance) do
    GenServer.cast(:bank, {:create_account, account, starting_balance})
  end

  def deposit(account, amount) do
    GenServer.cast(:bank, {:deposit, account, amount})
  end

  def get_balance(account) do
    GenServer.call(:bank, {:get_balance, account})
  end

  def withdraw(account, amount) do
    GenServer.call(:bank, {:withdraw, account, amount})
  end

  def init(ledger \\ %{}) do
    # Defined the state as a key/value store named as ledger
    # for semantic clarity.
    {:ok, ledger}
  end

  def handle_cast({:create_account, account, starting_balance}, ledger) do
    {:noreply, Map.put(ledger, account, starting_balance)}
  end

  def handle_cast({:deposit, account, amount}, ledger) do
    {:ok, current_balance} = Map.fetch(ledger, account)
    new_balance = current_balance + amount
    {:noreply, Map.put(ledger, account, new_balance)}
  end

  def handle_call({:get_balance, account}, _requester, ledger) do
    {:reply, Map.fetch(ledger, account), ledger}
  end

  def handle_call({:withdraw, account, amount}, _requester, ledger) do
    {:ok, current_balance} = Map.fetch(ledger, account)
    new_balance = current_balance - amount

    # Note - I choose not to care about the balance dipping under 0!
    {:reply, amount, Map.put(ledger, account, new_balance)}
  end

end
