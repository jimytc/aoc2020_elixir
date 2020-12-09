defmodule TextConstraint.ExactOneMatchInPositions do
  defstruct first_position: 0, second_position: 0, char: ""

  def validate(constraint, password) do
    char_at_first_position = String.at(password, constraint.first_position)
    char_at_second_position = String.at(password, constraint.second_position)
    (char_at_first_position != char_at_second_position) &&
      (char_at_first_position == constraint.char || char_at_second_position == constraint.char)
  end
end
