defmodule FlammableElixirBank.BankTest do
  use ExUnit.Case

  import FlammableElixirBank.Bank

  describe "create_account/1" do
    test "stores the account with the starting balance" do
      account = "Jimmy"
      starting_balance = 20

      create_account(account, starting_balance)
      
      assert get_balance(account) == {:ok, starting_balance}
    end
  end

  describe "get_balance/1" do
    test "retrieves the updated to date balance for the account" do
      account = "Johnny"
      balance = 50
      create_account(account, balance)

      assert {:ok, balance} == get_balance(account)

      deposit_amount = 20
      deposit(account, deposit_amount)

      assert {:ok, balance + deposit_amount} == get_balance(account)

      withdraw_amount = 10
      withdraw(account, withdraw_amount)

      assert {:ok, balance + deposit_amount - withdraw_amount} == get_balance(account)
    end
  end

  describe "deposit/2" do
    test "adds an amount on the existing balance" do
      account = "Jax"
      balance = 50
      create_account(account, balance)
      
      deposit_amount = 20
      deposit(account, deposit_amount)

      assert {:ok, balance + deposit_amount} == get_balance(account)
    end
  end

  describe "withdraw/2" do
    test "adds an amount on the existing balance" do
      account = "Jackie"
      balance = 50
      create_account(account, balance)
      
      withdraw_amount = 20
      withdraw(account, withdraw_amount)

      assert {:ok, balance - withdraw_amount} == get_balance(account)
    end
  end

end
