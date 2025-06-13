defmodule SaleReport.Core.MoneyFormatTest do
  use ExUnit.Case
  alias SaleReport.Core.MoneyFormat
  test "should convert to dollar" do
    assert MoneyFormat.format(34.45, "$") == "$34,45"
  end
end
