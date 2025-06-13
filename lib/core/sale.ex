defmodule SaleReport.Core.Sale do
  defstruct [:product, :quantity, :price]


  def sale_total(%{quantity: quantity, price: price}) do
    price * quantity
  end
end
