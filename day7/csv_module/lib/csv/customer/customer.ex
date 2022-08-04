defmodule CsvModule.Customeres.Customer do

  use Ecto.Schema

  schema "customeres" do
    field :customer_number, :string
    field :customer_name, :string
    field :credit_score, :integer
    field :prefectures, :string
  end
#チェンジセット用の関数を作成

  def changeset(struct, params) do
    struct
    |> Ecto.Changeset.cast(params,[:customer_number, :customer_name, :credit_score, :prefectures])
    |> Ecto.Changeset.validate_required([:customer_number])
  end

end
