defmodule SimpleCrawler do

  @moduledoc"""

  #与えられたドメインを利用して、TOPページのリンクを取得してリストにする
  #取得したURLを辿って、次のページにあるURLも取得する/他ドメインは無視
  #ドメインは以下の全ページを徘徊して、テキスト情報を取得する
  #https://thewaggletraining.github.io/
  """
  def get_url(url) do
    #TOPページのリンクを取得してリストする関数
    html = HTTPoison.get!(url)
    {:ok, document} = Floki.parse_document(html.body)
    document
    |> Floki.find("a")
    |> Floki.attribute("href")

  end

  def get_url_list(url_list) do
    #get_url関数で取得したURLをたどって次のページのURLを取得する
    #"https://thewaggletraining.github.io/"を含むURLのみ取得
    include = "https://thewaggletraining.github.io/"

    Enum.map(url_list, fn url -> SimpleCrawler.get_url(url) end)
    |> List.flatten()
    |> Enum.filter(&String.starts_with?(&1, include))

  end

  def get_page_text(url_list) do
    Enum.map(url_list, fn url ->
      html = HTTPoison.get!(url)
      {:ok, document} = Floki.parse_document(html.body)
      document |> Floki.find("body") |> Floki.text()
      |>String.replace([" ","\n"],"")
    end)
  end

  def main(url) do
    url_list = [url] ++ SimpleCrawler.get_url_list([url])
    get_page_text(url_list)
  end

end


defmodule Main do
  def main do
    SimpleCrawler.get_url("https://thewaggletraining.github.io/")
    |> SimpleCrawler.get_url_list()
    |> SimpleCrawler.get_page_text()
  end
end
