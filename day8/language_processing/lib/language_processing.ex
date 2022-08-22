defmodule LanguageProcessing do
  @moduledoc """
  Documentation for `LanguageProcessing`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LanguageProcessing.hello()
      :world

  """
  def p00 do
    word = "stressed"
    |> String.reverse()
  end

  def p01 do
    word = "パタトクカシーー"
    l = [0, 1, 2, 3, 4, 5, 6, 7]
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.map(&(String.at(word, &1)))
    |> Enum.join()
  end

  def p02 do
    word1 = "タクシー"
    |> String.to_charlist()
    word2 = "パトカー"
    |> String.to_charlist()
    Enum.zip(word2, word1)
    |> Enum.map(&(Tuple.to_list(&1)))
    |> List.flatten()
    |> List.to_string()
  end
end

defmodule Main do

  def main do
    IO.puts(LanguageProcessing.p00)
    IO.puts(LanguageProcessing.p01)
    IO.puts(LanguageProcessing.p02)
  end
end
