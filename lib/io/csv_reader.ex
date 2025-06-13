defmodule SaleReport.IO.CSVReader do
  def read(file_path) do
    File.read(file_path)
  end
end
