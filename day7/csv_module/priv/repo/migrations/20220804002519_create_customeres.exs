defmodule Csv.Repo.Migrations.CreateCustomeres do
  use Ecto.Migration

  def change do
    create table(:customeres) do
      add :customer_number, :string, null: false
      add :customer_name, :string, null: false
      add :credit_score, :integer, default: 0
      add :prefectures, :string, null: false
    end
  end
end
