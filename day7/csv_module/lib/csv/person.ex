defmodule CsvModule.Person do
  use Ecto.Schema

  schema "people" do
    field :name, :string
    field :age, :integer, default: 0
  end

  def changeset(struct,params) do
    struct
    |> Ecto.Changeset.cast(params,[:name,:age])
    |> Ecto.Changeset.validate_required([:name])
  end

end
