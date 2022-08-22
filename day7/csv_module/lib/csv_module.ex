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
  def file_export(data) do
    #dataは構造体？なので全部に対してEnum.mapで処理をかける。
    data = data
    #|> Enum.map(&IO.puts(&1.customer_number))
    |> Enum.map(& "\r\n#{&1.customer_number},#{&1.customer_name},#{&1.credit_score},#{&1.prefectures}")
    data = ["取引先番号,取引先名称,与信スコア,都道府県"] ++ data
    |> Enum.join()
    File.open!("new_CUSTOMER.csv",[:write])
    |> IO.binwrite(data)
  end
end

defmodule Main do
  def main() do
    CsvModule.read_csv("CUSTOMER.csv")
    |> CsvModule.processing_csv()
    |> Enum.map(&(CsvModule.Customeres.insert(&1)))
    data = CsvModule.Customeres.select_all()
    |> CsvModule.file_export()
  end
end
