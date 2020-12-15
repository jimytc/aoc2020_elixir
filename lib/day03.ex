defmodule Day03 do
  def count_trees_with_simple_slope_move(file_path) do
    map_lines = read_map(file_path)
    %SimpleMove{vx: 3, vy: 1}
    |> SimpleMove.calculate(length(map_lines))
    |> Enum.filter(fn move -> move.y <= length(map_lines) end)
    |> Enum.reduce(
         0,
         fn (move, acc) ->
           map_line = Enum.at(map_lines, move.y)
           poi_on_x = String.at(map_line, rem(move.x, String.length(map_line)))
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
