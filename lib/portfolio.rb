# frozen_string_literal: true

class Portfolio
  # Source: https://www.investopedia.com/terms/a/annualized-total-return.asp
  #
  # @param [Date] from date to start accruing
  # @param [Date] to date to end accruing
  # @return [Float] the geometric average amount of money earned each year over a given time period
  def profit(from:, to:)
    days_held = to - from

    cumulative_returns = stocks.map do |stock|
      (1 + stock.cumulative_return(from: from, to: to))**(365 / days_held) - 1
    end

    cumulative_returns.sum
  end

  # @param [Stock] stocks
  def initialize(stocks:)
    @stocks = stocks
  end

  private

  attr_reader :stocks
end
