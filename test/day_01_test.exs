defmodule Day01Test do
  use ExUnit.Case

  test 'use fixtures/day_01.txt' do
    file = Path.expand('test/fixtures/day_01.txt')
    assert Day01.with_file(file) == 514579
  end

  test 'use assets/day_01.txt' do
    file = Path.expand('assets/day_01.txt')

    Day01.with_file(file)
    |> IO.puts
    assert true
  end
end
