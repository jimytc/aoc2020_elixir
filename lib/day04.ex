defmodule Day04 do

  def part_one(file_path) do
    Enum.count(
      Passport.load(file_path),
      fn (passport) ->
        Passport.all_values_present?(passport) || Passport.all_values_except?(passport, :cid)
      end
    )
  end

  def part_two(file_path) do
    Enum.count(
      Passport.load(file_path),
      fn (passport) ->
        (Passport.all_values_present?(passport) || Passport.all_values_except?(passport, :cid)) &&
          Passport.all_values_valid?(passport)
      end
    )
  end
end
