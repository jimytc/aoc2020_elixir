defmodule PassportTest do
  use ExUnit.Case

  test 'load records with fixtures/day04.txt' do
    file = Path.expand('test/fixtures/day04.txt')
    assert 4 == Enum.count(Passport.load(file))
  end

  test 'first record should be match' do
    expected = %Passport{
      byr: 1937,
      iyr: 2017,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    file = Path.expand('test/fixtures/day04.txt')
    assert expected == hd(Passport.load(file))
  end
end
