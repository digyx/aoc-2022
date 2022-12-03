defmodule Day1 do
  def shared do
    File.read!("input/day1.txt")
    |> String.split("\n")
    |> Enum.chunk_by(&(&1 != ""))
    |> Enum.reject(&(&1 == [""]))
    |> Enum.map(fn enum ->
      enum
      |> Enum.map(fn i -> String.to_integer(i) end)
      |> Enum.sum()
    end)
  end

  def p1 do
    shared()
    |> Enum.max()
  end

  def p2 do
    shared()
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()
  end
end
