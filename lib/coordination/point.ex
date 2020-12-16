defmodule Coordination.Point do
  defstruct x: 0, y: 0

  def translate(point, offset) when offset == nil do
    point
  end

  def translate(point, offset) do
    translate_with_scale(point, offset, 1)
  end

  def steps(point, offset, steps) do
    steps_internal(point, offset, steps, [])
  end

  defp steps_internal(point, _offset, amount, carry) when amount == 0, do: [point | carry]

  defp steps_internal(point, offset, amount, carry) do
    new_point = translate_with_scale(point, offset, amount)
    steps_internal(point, offset, amount - 1, [new_point | carry])
  end

  defp translate_with_scale(point, offset, scale) do
    %Coordination.Point{
      x: point.x + offset.x * scale,
      y: point.y + offset.y * scale
    }
  end
end
