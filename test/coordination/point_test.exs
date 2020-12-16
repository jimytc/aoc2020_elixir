defmodule Coordination.PointTest do
  use ExUnit.Case

  test 'translate from (0,0) to (2,1) with offset (2,1)' do
    expected = %Coordination.Point{x: 2, y: 1}
    result = Coordination.Point.translate(%Coordination.Point{x: 0, y: 0}, %Coordination.Offset{x: 2, y: 1})
    assert expected == result
  end

  test 'steps from (0,0) with (3,5) two times gets [(0,0), (3,5), (6,10)]' do
    expected = [
      %Coordination.Point{x: 0, y: 0},
      %Coordination.Point{x: 3, y: 5},
      %Coordination.Point{x: 6, y: 10}
    ]
    result = Coordination.Point.steps(%Coordination.Point{x: 0, y: 0}, %Coordination.Offset{x: 3, y: 5}, 2)
    assert expected == result
  end
end
