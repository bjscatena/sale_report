defmodule SaleReport.IO.PrinterTest do
  use ExUnit.Case
  alias SaleReport.IO.Printer

  test "should print report text" do
    assert Printer.print_sale_result(16.35, "eraser") == """
           ====================
           Total sold: $16,35
           Best seller: eraser
           ====================
           """
  end
end
