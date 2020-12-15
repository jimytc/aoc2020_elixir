defmodule SimpleMoveTest do
  use ExUnit.Case

  test 'get [{0, 0}, {1, 2}] with vx: 2, vy: 1' do
    assert [%Move{x: 0, y: 0}, %Move{x: 2, y: 1}] == SimpleMove.calculate(%SimpleMove{vx: 2, vy: 1}, 2)
  end
end
