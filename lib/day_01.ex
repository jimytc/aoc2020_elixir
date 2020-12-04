defmodule Day01 do
  def two_sum(file_path) do
    numbers = read_to_list(file_path)
    numbers
    |> TwoSum.call(2020)
    |> Enum.map(&Enum.at(numbers, &1))
    |> Enum.reduce(1, fn (number, acc) -> acc * number end)
  end

  defp read_to_list(file_path) do
    {:ok, body} = File.read(file_path)
    String.split(body)
    |> Enum.map(&String.to_integer/1)
  end
end