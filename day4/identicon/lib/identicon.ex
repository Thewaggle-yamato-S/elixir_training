defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  string -> hash -> list
  ## Examples

      iex> Identicon.hash_input(args)
      {list_of_HashValue}
  """

  def hash_input(input) do
    hash =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hash}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _]} = image) do
    %Identicon.Image{image | color: [r, g, b ]}
  end

  def mirror_row(row) do
    [data1, data2, _tail] = row
    row ++ [data2, data1]
  end

  def build_grid(data) do
    # Enum.chunk_every(data.hex, 3, 3, :discard)
    list =
      Enum.chunk_every(data.hex, 3)
      |> List.delete_at(-1)
      |> Enum.map(&Identicon.mirror_row(&1))
      |> List.flatten()
      |> Enum.with_index()
      %Identicon.Image{data | grid: list}
  end

  def filter_add_cells(data) do
    filter =
    Enum.filter(data.grid, fn {value, _number} -> rem(value, 2) == 0 end)
    %Identicon.Image{data | grid: filter}
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image)do
    pixel_map =
      Enum.map grid, fn {_code, index} ->
        top_left = {rem(index, 5) * 50, div(index, 5) * 50}
        bottom_right = {rem(index, 5) * 50 + 50, div(index, 5) * 50 + 50}
        {top_left, bottom_right}
      end
      %Identicon.Image{image | pixel_map: pixel_map}
  end

  def build_image(%Identicon.Image{color: color, pixel_map: pixel_map}, name) do
    img = :egd.create(250, 250)
    fill = :egd.color({Enum.at(color, 0), Enum.at(color, 1), Enum.at(color, 2)})
    Enum.each pixel_map, fn {start, stop} ->
      :egd.filledRectangle(img, start, stop, fill)
    end
    :egd.save(:egd.render(img), "#{name}.png")
  end

end

defmodule Main do
  def main do
    name = IO.gets("")
    icon = Identicon.hash_input(name)
        |> Identicon.pick_color()
        |> Identicon.build_grid()
        |>Identicon.filter_add_cells()
        |>Identicon.build_pixel_map()
        |>Identicon.build_image(name)
    icon
  end
end
