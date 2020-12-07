defmodule Day02 do
  def valid_password_by_char_count(file_path) do
    load_password_records(file_path)
    |> Enum.count(
         fn {constraint, password} ->
           TextConstraint.CharAmount.validate(constraint, password)
         end
       )
  end

  defp load_password_records(file_path) do
    {:ok, body} = File.read(file_path)

    String.split(body, "\n")
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
end
