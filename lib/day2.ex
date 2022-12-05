defmodule Day2 do
  def decode_p1(round) do
    case round do
      # Rock
      x when x == "A" or x == "X" -> 1
      # Paper
      x when x == "B" or x == "Y" -> 2
      # Scissors
      x when x == "C" or x == "Z" -> 3
    end
  end

  def decode_p2([opponent, result]) do
    opponent =
      case opponent do
        "A" -> 1
        "B" -> 2
        "C" -> 3
      end

    result =
      case result do
        "X" -> -1
        "Y" -> 0
        "Z" -> 1
      end

    self =
      case Integer.mod(opponent + result, 3) do
        0 -> 3
        x -> x
      end

    [opponent, self]
  end

  def calc_score([opponent, self]) do
    case Integer.mod(self - opponent, 3) do
      0 -> self + 3
      1 -> self + 6
      2 -> self
    end
  end

  def p1 do
    File.read!("input/day2.txt")
    |> String.split("\n")
    # Drop the final \n
    |> Enum.drop(-1)
    |> Enum.map(fn round ->
      round
      |> String.split(" ")
      |> Enum.map(&decode_p1/1)
      |> calc_score()
    end)
    |> Enum.sum()
  end

  def p2 do
    File.read!("input/day2.txt")
    |> String.split("\n")
    # Drop the final \n
    |> Enum.drop(-1)
    |> Enum.map(fn round ->
      round
      |> String.split(" ")
      |> decode_p2()
      |> calc_score()
    end)
    |> Enum.sum()
  end
end
