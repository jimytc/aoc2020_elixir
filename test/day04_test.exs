defmodule Day04Test do
  use ExUnit.Case

  test 'part one with fixtures/day04.txt' do
    file = Path.expand('test/fixtures/day04.txt')
    assert Day04.part_one(file) == 2
  end

  test 'part one with assets/day04.txt' do
    file = Path.expand('assets/day04.txt')
    Day04.part_one(file)
    |> IO.puts()
    assert true
  end

  test 'part two with fixtures/day04.txt' do
    file = Path.expand('test/fixtures/day04.txt')
    assert Day04.part_two(file) == 2
  end

  test 'part two with assets/day04.txt' do
    file = Path.expand('assets/day04.txt')
    Day04.part_two(file)
    |> IO.puts()
    assert true
  end
end
