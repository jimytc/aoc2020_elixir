defmodule Day03Test do
  use ExUnit.Case

  test 'part one with fixtures/day03.txt' do
    file = Path.expand('test/fixtures/day03.txt')
    assert Day03.part_one(file) == 7
  end

  test 'part one with assets/day03.txt' do
    file = Path.expand('assets/day03.txt')
    Day03.part_one(file)
    |> IO.puts()
    assert true
  end

  test 'part two with fixtures/day03.txt' do
    file = Path.expand('test/fixtures/day03.txt')
    assert Day03.part_two(file) == 336
  end

  test 'part two with assets/day03.txt' do
    file = Path.expand('assets/day03.txt')
    Day03.part_two(file)
    |> IO.puts()
    assert true
  end

end
