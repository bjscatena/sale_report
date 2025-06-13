defmodule SaleReport do
  alias SaleReport.IO.{CSVReader, Printer}
  alias SaleReport.Core.{SaleFactory, SaleStatistic}

  def process(file) do
    sales =
      CSVReader.read(file)
      |> get_content()
      |> String.split("\r\n")
      |> Enum.map(&SaleFactory.csv_row_to_sale(&1))
      |> Enum.flat_map(fn
        {:ok, sale} -> [sale]
        {:error, _} -> []
      end)

    best_seller = SaleStatistic.best_seller(sales)
    total_sold = SaleStatistic.total_sold(sales)

    IO.puts(Printer.print_sale_result(total_sold, best_seller))
  end

  defp get_content({:ok, content}), do: content
end
