# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day04/main'

describe 'PassportPart1' do
  def setup
    @passport = PassportPart1.new
  end
  describe '#add_line' do
    it 'adds a line to make a valid passport' do
      @passport.add_line 'ecl:gry pid:860033327 eyr:2020 hcl:#fffffd'
      @passport.add_line 'byr:1937 iyr:2017 cid:147 hgt:183cm'

      assert @passport.valid?
    end

    it 'adds a line to make an invalid passport' do
      @passport.add_line 'iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884'
      @passport.add_line 'hcl:#cfa07d byr:1929'

      refute @passport.valid?
    end
  end
end

describe 'PassportPart2' do
  def setup
    @passport = PassportPart2.new
  end
  describe '#add_line' do
    it 'adds a line to make a valid passport' do
      @passport.add_line 'pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980'
      @passport.add_line 'hcl:#623a2f'

      assert @passport.valid?
    end

    it 'adds a line to make an invalid ecl passport' do
      @passport.add_line 'pid:087499704 hgt:74in ecl:xxx iyr:2012 eyr:2030 byr:1980'
      @passport.add_line 'hcl:#623a2f'

      refute @passport.valid?
    end

    it 'adds a line to make an invalid passport' do
      @passport.add_line 'eyr:1972 cid:100'
      @passport.add_line 'hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926'

      refute @passport.valid?
    end

    it 'does another invalid' do
      @passport.add_line 'iyr:2019'
      @passport.add_line 'hcl:#602927 eyr:1967 hgt:170cm'
      @passport.add_line 'ecl:grn pid:012533040 byr:1946'

      refute @passport.valid?
    end

    it 'does yet another' do
      @passport.add_line 'cl:dab227 iyr:2012'
      @passport.add_line 'ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277'

      refute @passport.valid?
    end

    it 'does the last invalid example' do
      @passport.add_line 'hgt:59cm ecl:zzz'
      @passport.add_line 'eyr:2038 hcl:74454a iyr:2023'
      @passport.add_line 'pid:3556412378 byr:2007'

      refute @passport.valid?
    end
  end
end
