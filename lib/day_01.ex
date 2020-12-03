defmodule Day01 do
  def with_file(file_path) do
    numbers = read_to_list(file_path)
    TwoSum.call(numbers, 2020)
    |> Enum.reduce(1, fn (index, acc) -> acc * Enum.at(numbers, index) end)
  end

  defp read_to_list(file_path) do
    {:ok, body} = File.read(file_path)
    String.split(body)
    |> Enum.map(&String.to_integer/1)
  end
end