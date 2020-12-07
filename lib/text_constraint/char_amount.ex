defmodule TextConstraint.CharAmount do
  defstruct at_least: 0, at_most: 0, char: ""

  def validate(constraint, password) do
    amount = amount_of_target_char(constraint, password)
    constraint.at_least..constraint.at_most
    |> Enum.member?(amount)
  end

  defp amount_of_target_char(constraint, password) do
    original_length = String.length(password)
    reduced_length = String.replace(password, constraint.char, "")
                     |> String.length()
    original_length - reduced_length
  end
end
