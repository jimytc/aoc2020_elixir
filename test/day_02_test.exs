defmodule Day02Test do
  use ExUnit.Case

  test 'use fixtures/day_02.txt' do
    file = Path.expand('test/fixtures/day_02.txt')
    assert Day02.valid_password_by_char_count(file) == 2
  end

  test 'use assets/day_02.txt' do
    file = Path.expand('assets/day_02.txt')
    Day02.valid_password_by_char_count(file)
    |> IO.puts()
    assert true
  end
end
