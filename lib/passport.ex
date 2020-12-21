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
