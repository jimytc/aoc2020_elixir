defmodule Day03Test do
  use ExUnit.Case

  test 'use fixtures/day_03.txt simple slope moving' do
    file = Path.expand('test/fixtures/day_03.txt')
    assert Day03.count_trees_with_simple_slope_move(file) == 7
  end

  test 'use assets/day_03.txt with simple slope moving' do
    file = Path.expand('assets/day_03.txt')
    Day03.count_trees_with_simple_slope_move(file)
    |> IO.puts()
    assert true
  end
end
