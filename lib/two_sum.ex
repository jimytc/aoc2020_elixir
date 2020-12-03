defmodule TwoSum do
  def call(numbers, target) do
    internal(numbers, target, 0, %{}) || []
  end

  defp internal([], _target, _index, _lookup) do [] end

  defp internal(numbers, target, index, lookup) do
    [head | tail] = numbers
    diff = target - head
    case Map.fetch(lookup, diff) do
      :error ->
        internal(tail, target, index + 1, Map.put(lookup, head, index))
      {:ok, found_index} ->
        [found_index, index]
    end
  end
end
