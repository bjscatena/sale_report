defmodule SaleReport.Core.SaleStatistic do
  alias SaleReport.Core.Sale

  def total_sold(sales) do
    sales
    |> Enum.map(fn %Sale{quantity: quantity, price: price} -> quantity * price end)
    |> Enum.sum()
  end

  def best_seller(sales) do
    sales
    |> Enum.max_by(fn sale -> Sale.sale_total(sale) end)
    |> Map.get(:product)
  end
end
