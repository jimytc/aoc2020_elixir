defmodule Day03 do
  def part_one(file_path) do
    read_map(file_path)
    |> count_trees(%Coordination.Point{x: 0, y: 0}, %Coordination.Offset{x: 3, y: 1})
  end

  def part_two(file_path) do
    map_lines = read_map(file_path)
    origin = %Coordination.Point{x: 0, y: 0}
    [
      %Coordination.Offset{x: 1, y: 1},
      %Coordination.Offset{x: 3, y: 1},
      %Coordination.Offset{x: 5, y: 1},
      %Coordination.Offset{x: 7, y: 1},
      %Coordination.Offset{x: 1, y: 2},
    ]
    |> Enum.reduce(
         1,
         fn (offset, acc) ->
           acc * count_trees(map_lines, origin, offset)
         end
       )
  end

  defp count_trees(map_lines, origin, offset) do
    Coordination.Point.steps(origin, offset, length(map_lines) - 1)
    |> Enum.filter(fn offset -> offset.y <= length(map_lines) end)
    |> Enum.reduce(
         0,
         fn (offset, acc) ->
           map_line = Enum.at(map_lines, offset.y)
           poi_on_x = String.at(map_line, rem(offset.x, String.length(map_line)))
           case poi_on_x do
             "." -> acc
             "#" -> acc + 1
           end
         end
       )
  end

  defp read_map(file_path) do
    Input.read(file_path)
  end
end
