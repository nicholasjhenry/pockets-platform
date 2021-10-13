defmodule ClientsTest do
  use ExUnit.Case
  doctest Clients

  test "greets the world" do
    assert Clients.hello() == :world
  end
end
