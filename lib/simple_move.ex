defmodule SimpleMove do
  defstruct vx: 0, vy: 0

  def calculate(velocity, amount_of_moves) when amount_of_moves < 0 do
    [] end

  def calculate(velocity, amount_of_moves) do
    0..(amount_of_moves - 1)
    |> Enum.map(
         fn nth_move ->
           %Move{
             x: velocity.vx * nth_move,
             y: velocity.vy * nth_move
           }
         end
       )
  end
end
