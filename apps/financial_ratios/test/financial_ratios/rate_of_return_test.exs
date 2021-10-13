defmodule FinancialRatios.RateofReturnTest do
  use ExUnit.Case, async: true

  doctest FinancialRatios.RateOfReturn

  alias FinancialRatios.RateOfReturn

  describe "calculating " do
    test "current value and the initial value returns the rate of return" do
      current_value = Decimal.new(335_000)
      initial_value = Decimal.new(250_000)

      calculated_rate_of_return = RateOfReturn.calculate(current_value, initial_value)

      assert RateOfReturn.compare(calculated_rate_of_return, RateOfReturn.new("34")) == :eq
    end
  end
end
