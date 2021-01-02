defmodule Passport do
  defstruct byr: nil, iyr: nil, eyr: nil, hgt: nil, hcl: nil, ecl: nil, pid: nil, cid: nil

  def load(file_path) do
    case File.read(file_path) do
      {:ok, body} ->
        String.split(body, "\n\n")
        |> construct_records
      {:error, _} ->
        :error
    end
  end

  def all_values_present?(password) do
    Enum.all?(Map.from_struct(password), fn {key, value} -> value != nil end)
  end

  def all_values_except?(password, target) do
    !Enum.any?(Map.from_struct(password), fn {key, value} -> key != target && value == nil end)
  end

  def all_values_valid?(passport) do
    byr_valid?(passport.byr) && iyr_valid?(passport.iyr) && eyr_valid?(passport.eyr) && hcl_valid?(passport.hcl) &&
      ecl_valid?(passport.ecl) && pid_valid?(passport.pid) && hgt_valid?(passport.hgt)
  end

  defp byr_valid?(byr) when is_number(byr) and byr >= 1920 and byr <= 2002, do: true
  defp byr_valid?(_byr), do: false
  defp iyr_valid?(iyr) when is_number(iyr) and iyr >= 2010 and iyr <= 2020, do: true
  defp iyr_valid?(_iyr), do: false
  defp eyr_valid?(eyr) when is_number(eyr) and eyr >= 2020 and eyr <= 2030, do: true
  defp eyr_valid?(_eyr), do: false
  defp hcl_valid?("#" <> color_code) do
    String.match?(color_code, ~r/^[0-9a-f]{6}$/)
  end
  defp hcl_valid?(_ecl), do: false
  defp ecl_valid?("amb"), do: true
  defp ecl_valid?("blu"), do: true
  defp ecl_valid?("brn"), do: true
  defp ecl_valid?("gry"), do: true
  defp ecl_valid?("grn"), do: true
  defp ecl_valid?("hzl"), do: true
  defp ecl_valid?("oth"), do: true
  defp ecl_valid?(_ecl), do: false
  defp pid_valid?("000000000"), do: false
  defp pid_valid?(pid) do
    String.match?(pid, ~r/^[0-9]{9}$/)
  end
  defp hgt_valid?(hgt) do
    cond do
      String.match?(hgt, ~r/^1([5-8][0-9]|9[0-3])cm$/) ->
        true
      String.match?(hgt, ~r/^(59|6[0-9]|7[0-6]|)in$/) ->
        true
      true -> false
    end

  end

  defp construct_records(raw_records) do
    raw_records
    |> Enum.map(&construct_record(&1))
  end

  defp construct_record(raw) do
    data = String.replace(raw, "\n", " ")
    %Passport{
      byr: extract_integer_for_key("byr", data),
      iyr: extract_integer_for_key("iyr", data),
      eyr: extract_integer_for_key("eyr", data),
      hgt: extract_text_for_key("hgt", data),
      hcl: extract_text_for_key("hcl", data),
      ecl: extract_text_for_key("ecl", data),
      pid: extract_text_for_key("pid", data),
      cid: extract_text_for_key("cid", data)
    }
  end

  defp extract_integer_for_key(key, raw) do
    value = extract_text_for_key(key, raw)
    case value do
      nil -> nil
      _ -> String.to_integer(value)
    end
  end

  defp extract_text_for_key(key, raw) do
    captured = Regex.named_captures(~r/(\A| ){1}#{key}:(?<#{key}>(#){0,1}\w+)(\z| ){1}/, raw)
    case captured do
      nil -> nil
      _ -> captured[key]
    end
  end
end
