defmodule Day01Test do
  use ExUnit.Case

  test 'two_sum use fixtures/day_01.txt' do
    file = Path.expand('test/fixtures/day_01.txt')
    assert Day01.two_sum(file) == 514579
  end

  test 'two_sum use assets/day_01.txt' do
    file = Path.expand('assets/day_01.txt')

    Day01.two_sum(file)
    |> IO.puts
    assert true
  end

  test 'three_sum use fixtures/day_01.txt' do
    file = Path.expand('test/fixtures/day_01.txt')
    assert Day01.three_sum(file) == 241861950
  end

  test 'three_sum use assets/day_01.txt' do
    file = Path.expand('assets/day_01.txt')

    Day01.three_sum(file)
    |> IO.puts
    assert true
  end
end
