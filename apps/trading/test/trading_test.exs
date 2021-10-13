defmodule TradingTest do
  use ExUnit.Case
  doctest Trading

  test "greets the world" do
    assert Trading.hello() == :world
  end
end
