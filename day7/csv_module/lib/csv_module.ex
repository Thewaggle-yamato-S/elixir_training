defmodule CsvModule do
  def read_csv(csv_file) do
    File.read!(csv_file)
  end

  def processing_csv(data) do

    [_field_name | value] = String.split(data, "\r\n")

    #field = String.split(field_name, ",")
    field = ["customer_number","customer_name","credit_score","prefectures"]
    value = Enum.map(value, &String.split(&1, ","))
    |> Enum.map(&Enum.into(Enum.zip(field, &1), %{}))
  end
  def file_export(query) do
    Csv.Repo.stream(query)
    |> Csv.Repo.transaction(&(Enum.to_list(&1)))
    #File.write("new_CUSTOMER.csv", data)
  end
end

defmodule Main do
  def main() do
    CsvModule.read_csv("CUSTOMER.csv")
    |> CsvModule.processing_csv()
    |> Enum.map(&(CsvModule.Customeres.insert(&1)))
    query = CsvModule.Customeres.select_all()
    |> CsvModule.file_export()
  end
end
