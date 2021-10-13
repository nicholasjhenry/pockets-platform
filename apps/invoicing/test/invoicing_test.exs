defmodule InvoicingTest do
  use ExUnit.Case
  doctest Invoicing

  test "greets the world" do
    assert Invoicing.hello() == :world
  end
end
