defmodule SaleReport.Core.Sale do
  @typedoc "Representa uma única linha de venda do arquivo CSV."
  @type t :: %__MODULE__{
          product: String.t(),
          quantity: integer(),
          price: float()
        }

  defstruct [:product, :quantity, :price]

  def sale_total(%{quantity: quantity, price: price}) do
    price * quantity
  end
end
