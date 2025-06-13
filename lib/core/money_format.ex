defmodule SaleReport.Core.MoneyFormat do
  def format(value, currency) do
    formated_value =
      value
      |> Float.to_string()
      |> String.replace(".", ",")

    currency <> formated_value
  end
end
