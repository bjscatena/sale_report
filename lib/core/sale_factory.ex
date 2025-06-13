defmodule SaleReport.Core.SaleFactory do
  alias SaleReport.Core.Sale

  def csv_row_to_sale(csv_row) do
    csv_row
    |> String.split(",")
    |> split_column_to_sale()
  end

  defp split_column_to_sale([product, quantity, price]) do
    sale = %Sale{
      product: product,
      quantity: quantity |> String.to_integer(),
      price: price |> String.to_float()
    }

    {:ok, sale}
  end

  defp split_column_to_sale(_), do: {:error, "Unable to convert row to sale"}
end
