defmodule SaleReport.Core.SaleFactory do
  alias SaleReport.Core.Sale

  def csv_row_to_sale(row) do
    case String.split(row, ",") do

      [product, quantity_str, price_str] ->
        build_sale(product, quantity_str, price_str)
      _other ->
        {:error, :invalid_row_format, row}
    end
  end

  # Função auxiliar privada para a construção
  defp build_sale(product, quantity_str, price_str) do
    # Em um projeto real, você poderia usar uma estrutura `with` aqui
    # para lidar com falhas na conversão de string para número.
    # Por enquanto, vamos manter simples.
    sale = %Sale{
      product: String.trim(product),
      quantity: String.to_integer(String.trim(quantity_str)),
      price: String.to_float(String.trim(price_str))
    }
    {:ok, sale}
  rescue
    # Se String.to_integer ou String.to_float falhar
    ArgumentError -> {:error, :invalid_number_format, "#{quantity_str},#{price_str}"}
  end
end
