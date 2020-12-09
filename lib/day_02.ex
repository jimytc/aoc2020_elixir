defmodule Day02 do
  def valid_password_by_char_count(file_path) do
    load_password_records(file_path)
    |> transform_with_word_count_constraint
    |> Enum.count(
         fn {constraint, password} ->
           TextConstraint.CharAmount.validate(constraint, password)
         end
       )
  end

  def valid_password_by_positions(file_path) do
    load_password_records(file_path)
    |> transform_with_exact_one_match
    |> Enum.count(
         fn {constraint, password} ->
           TextConstraint.ExactOneMatchInPositions.validate(constraint, password)
         end
       )
  end

  defp load_password_records(file_path) do
    {:ok, body} = File.read(file_path)

    String.split(body, "\n")
  end

  defp transform_with_word_count_constraint(records) do
    records
    |> Enum.map(&String.split(&1, [" ", "-", ": "]))
    |> Enum.map(
         fn record ->
           [r_start | [r_end | [char | [password | []]]]] = record

           {
             %TextConstraint.CharAmount{
               at_least: String.to_integer(r_start),
               at_most: String.to_integer(r_end),
               char: char
             },
             password
           }
         end
       )
  end

  defp transform_with_exact_one_match(records) do
    records
    |> Enum.map(&String.split(&1, [" ", "-", ": "]))
    |> Enum.map(
         fn record ->
           [r_start | [r_end | [char | [password | []]]]] = record

           {
             %TextConstraint.ExactOneMatchInPositions{
               first_position: String.to_integer(r_start) - 1,
               second_position: String.to_integer(r_end) - 1,
               char: char
             },
             password
           }
         end
       )
  end
end
