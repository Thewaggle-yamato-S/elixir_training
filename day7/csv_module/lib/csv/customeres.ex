defmodule CsvModule.Customeres do


  #テーブルにデータを保存するための関数insert
  def insert(data) do
    CsvModule.Customeres.Customer.changeset(%CsvModule.Customeres.Customer{}, data)
    |> Csv.Repo.insert()
  end
  #全てのレコードを取得するための関数 select_all
  def select_all() do
    require Ecto.Query
    query = Ecto.Query.from(CsvModule.Customeres.Customer)
    Csv.Repo.all(query)
  end

  #取引先名称(:customer_name)を基に絞り込んだレコードを取得するための関数 selecto_name を作る
  def select_name(name) do
    require Ecto.Query
    Ecto.Query.from(c in CsvModule.Customeres.Customer, where: c.customer_name == ^name)
  end

  def update(data) do
    CsvModule.Customeres.Customer.changeset(%CsvModule.Customeres.Customer{}, data)
    |> Csv.Repo.update()
  end

  def delete(data) do
      CsvModule.Customers.Customer.changeset(%CsvModule.Customeres.Customer{}, data)
      |> Csv.Repo.delete()
  end

  def main() do
    CsvModule.read_csv("CUSTOMER.csv")
    |> CsvModule.processing_csv()
    |> Enum.map(&(CsvModule.Customeres.insert(&1)))

  end
end
