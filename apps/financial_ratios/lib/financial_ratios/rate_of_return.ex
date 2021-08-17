defmodule FinancialRatios.RateOfReturn do
  @formula ~S|
  \text{Rate of return} = [\frac{(\text{Current value} - \text{Initial value})}{\text{Initial value}}]\times 100
  |

  @moduledoc """
  > A rate of return (RoR) is the net gain or loss of an investment over a specified time period,
  > expressed as a percentage of the investment’s initial cost.
  >
  > [Investopedia](https://www.investopedia.com/terms/r/rateofreturn.asp)

  The Formula for Rate of Return (RoR): $$#{@formula}$$
  """
end
