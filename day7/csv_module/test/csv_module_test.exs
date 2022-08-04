defmodule CsvModuleTest do
  use ExUnit.Case
  doctest CsvModule

  test "greets the world" do
    assert CsvModule.hello() == :world
  end
end
