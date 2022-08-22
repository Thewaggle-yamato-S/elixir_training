defmodule GtsParser do
  @moduledoc """
  Documentation for `GtsParser`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GtsParser.hello()
      :world

  """
  def to_map do
    :world
  end
end

defmodule Main do
  def main do
    path = "cube.gts"
    {:ok, f} = File.open(path)
    data = IO.read(f, :all)
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(Enum.filter(&1, fn x -> x != "" end)))
    [info | data] = data
    [vertexes, edges, num_of_triangles] = info
    #|> Enum.map(&(Enum.map(&1, fn x -> String.to_integer(x) end)))
    #File.close(f)
  end
end
