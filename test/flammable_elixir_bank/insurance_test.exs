defmodule FlammableElixirBank.InsuranceTest do
  use ExUnit.Case

  import FlammableElixirBank.Insurance

  describe "store/1" do
    test "it stores the ledger data" do
      ledger = %{"Jonny": 50, "Jimmy": 25}
      store(ledger)
      assert ledger == get()

      new_ledger = %{"Derrick": 20, "David": 10}
      store(new_ledger)

      assert new_ledger == get()
    end
  end

  describe "get/0" do
    test "it returns the stored data" do
      ledger = %{"Jonny": 50, "Jimmy": 25}
      store(ledger)
      assert ledger == get()
    end
  end

end

