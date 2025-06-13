defmodule SaleReport.CSVReaderTest do
  use ExUnit.Case
  alias SaleReport.IO.CSVReader

  @tag :integration
  test "should read csv content" do
    file_path = "test/fixtures/test_sales.csv"
    expected_result = "pencil,25,1.20\r\nnotebook,10,5.50"
    assert CSVReader.read(file_path) == {:ok, expected_result}
  end
end
