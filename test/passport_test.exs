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

  test 'invalid byr above 2002' do
    passport = %Passport{
      byr: 2003,
      iyr: 2017,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'invalid byr under 1920' do
    passport = %Passport{
      byr: 1919,
      iyr: 2017,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'valid byr between 1920 and 2002' do
    passport = %Passport{
      byr: 1920,
      iyr: 2017,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    assert Passport.all_values_valid?(passport)
  end

  test 'valid iyr between 2010 and 2020' do
    passport = %Passport{
      byr: 2000,
      iyr: 2017,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    assert Passport.all_values_valid?(passport)
  end

  test 'invalid iyr under 2010' do
    passport = %Passport{
      byr: 2000,
      iyr: 2009,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'invalid iyr above 2020' do
    passport = %Passport{
      byr: 2000,
      iyr: 2021,
      eyr: 2020,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'valid eyr between 2020 and 2030' do
    passport = %Passport{
      byr: 2000,
      iyr: 2017,
      eyr: 2025,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    assert Passport.all_values_valid?(passport)
  end

  test 'invalid eyr under 2020' do
    passport = %Passport{
      byr: 2000,
      iyr: 2017,
      eyr: 2019,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'invalid eyr above 2030' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2031,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fffffd",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'invalid hcl given #gggggg' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2030,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#gggggg",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'invalid hcl given #fff' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2030,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#fff",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'valid hcl given #ffffff' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2030,
      hgt: "183cm",
      ecl: "gry",
      hcl: "#ffffff",
      pid: "860033327",
      cid: "147"
    }
    assert Passport.all_values_valid?(passport)
  end

  test 'invalid ecl given not in amb blu brn gry grn hzl oth' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2030,
      hgt: "183cm",
      ecl: "bbb",
      hcl: "#ffffff",
      pid: "860033327",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'valid given ecl in amb blu brn gry grn hzl oth' do
    for ecl <- ~w/amb blu brn gry grn hzl oth/ do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "183cm",
        ecl: ecl,
        hcl: "#ffffff",
        pid: "860033327",
        cid: "147"
      }
      assert Passport.all_values_valid?(passport)
    end
  end

  test 'valid given pid is 000000001 or 999999999' do
    for pid <- ~w/000000001 999999999/ do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "183cm",
        ecl: "amb",
        hcl: "#ffffff",
        pid: pid,
        cid: "147"
      }
      assert Passport.all_values_valid?(passport)
    end
  end

  test 'invalid given pid is not a 9 digits number' do
    for pid <- ~w/0 00 000 0000 00000 000000 0000000 00000000/ do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "183cm",
        ecl: "amb",
        hcl: "#ffffff",
        pid: pid,
        cid: "147"
      }
      refute Passport.all_values_valid?(passport)
    end
  end

  test 'invalid given pid is all zeros' do
    passport = %Passport{
      byr: 2000,
      iyr: 2020,
      eyr: 2030,
      hgt: "183cm",
      ecl: "amb",
      hcl: "#ffffff",
      pid: "000000000",
      cid: "147"
    }
    refute Passport.all_values_valid?(passport)
  end

  test 'valid given hgt is 150-193cm' do
    for hgt <- (150..193) do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "#{hgt}cm",
        ecl: "amb",
        hcl: "#ffffff",
        pid: "000000001",
        cid: "147"
      }
      assert Passport.all_values_valid?(passport)
    end
  end

  test 'invalid given hgt is 149cm or 194cm' do
    for hgt <- ~w/149cm 194cm/ do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "#{hgt}in}",
        ecl: "amb",
        hcl: "#ffffff",
        pid: "000000001",
        cid: "147"
      }
      refute Passport.all_values_valid?(passport)
    end
  end


  test 'valid given hgt is 59-76in' do
    for hgt <- (59..76) do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "#{hgt}in",
        ecl: "amb",
        hcl: "#ffffff",
        pid: "000000001",
        cid: "147"
      }
      assert Passport.all_values_valid?(passport)
    end
  end

  test 'invalid given hgt is 58in or 77in' do
    for hgt <- ~w/58in 77in/ do
      passport = %Passport{
        byr: 2000,
        iyr: 2020,
        eyr: 2030,
        hgt: "#{hgt}in}",
        ecl: "amb",
        hcl: "#ffffff",
        pid: "000000001",
        cid: "147"
      }
      refute Passport.all_values_valid?(passport)
    end
  end
end
