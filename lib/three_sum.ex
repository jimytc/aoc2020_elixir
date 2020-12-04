defmodule ThreeSum do
  def call(numbers, target) when length(numbers) < 3 do
    []
  end

  def call(numbers, target) do
    internal(numbers, target, 0) || []
  end

  defp internal([], _target, _index) do
    []
  end

  defp internal(numbers, target, index) do
    [head | tail] = numbers
    diff = target - head
    result = TwoSum.call(tail, diff)
    cond do
      length(result) == 0 ->
        internal(tail, target, index + 1)
      length(result) == 2 ->
        [second | [third | _]] = result
        [index, second + index + 1, third + index + 1]
    end
  end
end
