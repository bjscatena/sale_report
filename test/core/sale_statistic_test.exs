defmodule SaleReport.Core.SaleStatisticTest do
  use ExUnit.Case

  alias SaleReport.Core.{Sale, SaleStatistic}

  test "should return total sold" do
    sales = [
      %Sale{product: "pen", quantity: 1, price: 1.0},
      %Sale{product: "pencil", quantity: 3, price: 2.0},
      %Sale{product: "eraser", quantity: 2, price: 5.0}
    ]

    assert SaleStatistic.total_sold(sales) == 17.0
  end

  test "should return best seller" do
    sales = [
      %Sale{product: "pen", quantity: 1, price: 1.0},
      %Sale{product: "pencil", quantity: 3, price: 2.0},
      %Sale{product: "eraser", quantity: 2, price: 5.0}
    ]

    assert SaleStatistic.best_seller(sales) == "eraser"
  end
end
