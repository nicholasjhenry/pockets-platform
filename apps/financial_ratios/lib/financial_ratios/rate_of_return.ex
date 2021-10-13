defmodule FinancialRatios.RateOfReturn do
  @formula ~S|
  \text{Rate of return} = [\frac{(\text{Current value} - \text{Initial value})}{\text{Initial value}}]\times 100
  |

  defstruct [:value]

  @moduledoc """
  > A rate of return (RoR) is the net gain or loss of an investment over a specified time period,
  > expressed as a percentage of the investment’s initial cost.
  >
  > [Investopedia](https://www.investopedia.com/terms/r/rateofreturn.asp)

  The Formula for Rate of Return (RoR): $$#{@formula}$$

  ## Example of a Rate of Return (RoR)

  > The rate of return can be calculated for any investment, dealing with any kind of asset. Let's
  > take the example of purchasing a home as a basic example for understanding how to calculate the
  > RoR. Say that you buy a house for $250,000 (for simplicity let's assume you pay 100% cash).

  > Six years later, you decide to sell the house—maybe your family is growing and you need to move
  > into a larger place. You are able to sell the house for $335,000, after deducting any realtor's
  > fees and taxes. The simple rate of return on the purchase and sale of the house is as follows:

      iex> FinancialRatios.RateOfReturn.calculate(335_000, 250_000)
      #FinancialRatios.RateOfReturn<34.00%>
  """

  @doc """
  Creates a new rate of return from a decimal or a string representation.

  ## Examples

      iex> FinancialRatios.RateOfReturn.new(Decimal.new("3.14"))
      #FinancialRatios.RateOfReturn<3.14%>

      iex> FinancialRatios.RateOfReturn.new("3.14")
      #FinancialRatios.RateOfReturn<3.14%>
  """
  def new(value) when is_binary(value) do
    %__MODULE__{value: Decimal.new(value)}
  end

  def new(%Decimal{} = value) do
    %__MODULE__{value: value}
  end

  @doc """
  Calculates the rate of return from a current value and an initial value. See module doc for
  more information.
  """
  def calculate(current_value, initial_value) do
    current_value
    |> Decimal.sub(initial_value)
    |> Decimal.div(initial_value)
    |> Decimal.mult(100)
    |> new
  end

  @doc """
  Compares two rate of returns numerically. If the first rate of return is greater than the
  second :gt is returned, if less than :lt is returned, if both rate of returns are
  equal :eq is returned.

  ## Examples

      iex> alias FinancialRatios.RateOfReturn
      ...> RateOfReturn.compare(RateOfReturn.new("0.1"), RateOfReturn.new("0.1"))
      :eq

      iex> alias FinancialRatios.RateOfReturn
      ...> RateOfReturn.compare(RateOfReturn.new("0.1"), RateOfReturn.new("0.2"))
      :lt
  """
  def compare(lhs, rhs) do
    Decimal.compare(lhs.value, rhs.value)
  end

  defimpl Inspect do
    def inspect(struct, _opts) do
      "#FinancialRatios.RateOfReturn<" <> Decimal.to_string(struct.value) <> "%>"
    end
  end
end
