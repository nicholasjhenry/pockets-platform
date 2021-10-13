defmodule AdminTest do
  use ExUnit.Case
  doctest Admin

  test "greets the world" do
    assert Admin.hello() == :world
  end
end
