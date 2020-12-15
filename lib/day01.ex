defmodule Day01 do
  def two_sum(file_path) do
    numbers = read_to_list(file_path)
    numbers
    |> TwoSum.call(2020)
    |> Enum.map(&Enum.at(numbers, &1))
    |> Enum.reduce(1, fn (number, acc) -> acc * number end)
  end

  def three_sum(file_path) do
    numbers = read_to_list(file_path)
    numbers
    |> ThreeSum.call(2020)
    |> Enum.map(&Enum.at(numbers, &1))
    |> Enum.reduce(1, fn (number, acc) -> acc * number end)
  end

  defp repair(numbers, indexes) do
    indexes
    |> Enum.map(&Enum.at(numbers, &1))
    |> Enum.reduce(1, fn (number, acc) -> acc * number end)
  end

  defp read_to_list(file_path) do
    Input.read(file_path)
    |> Enum.map(&String.to_integer/1)
  end
end