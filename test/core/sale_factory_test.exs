defmodule SaleReport.Core.SaleFactoryTest do
  use ExUnit.Case

  alias SaleReport.Core.{Sale, SaleFactory}

  test "should create sale when provided corret csv row" do
    fake_row = "pen,10,2.5"

    assert SaleFactory.csv_row_to_sale(fake_row) ==
             {:ok,
              %Sale{
                product: "pen",
                quantity: 10,
                price: 2.5
              }}
  end

  test "should present error when invalid csv row" do
    wrong_row = "pen,3"
    assert SaleFactory.csv_row_to_sale(wrong_row) == {:error, "Unable to convert row to sale"}
  end
end
