defmodule SaleReport.IO.Printer do
  alias SaleReport.Core.MoneyFormat

  def print_sale_result(total, best_seller) do
    formated_total = MoneyFormat.format(total, "$")

    """
    ====================
    Total sold: #{formated_total}
    Best seller: #{best_seller}
    ====================
    """
  end
end
