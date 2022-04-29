# frozen_string_literal: true

class Stock
  # @param [Date] date the target date used to calculate the stock price
  # @return [Money] the stock price for given date
  def price(date)
    StockCalculator.new(self).call(date) # => internal library used to encapsulate all the logic behind the calculation
  end

  # Source: https://www.investopedia.com/terms/c/cumulativereturn.asp
  #
  # @param [Date] from
  # @param [Date] to
  # @return [Float] the aggregate amount that the investment has gained or lost over time
  def cumulative_return(from: created_at.to_date, to: Date.today)
    starting_price = price(from)
    (price(to) - starting_price) / starting_price.to_f
  end

  def created_at
    # retrieves the timestamp from database
  end
end
