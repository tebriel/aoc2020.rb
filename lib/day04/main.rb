# frozen_string_literal: true

# A representation of a passport
class Passport
  def initialize
    @fields = {
      byr: nil,
      iyr: nil,
      eyr: nil,
      hgt: nil,
      hcl: nil,
      ecl: nil,
      pid: nil
    }
  end

  def add_line(line)
    values = line.split
    values.each do |value|
      data = value.split(':')
      data[1] = data[1].to_i if data[0].end_with?('yr')
      @fields[data[0]] = data[1]
    end
  end

  def valid?
    false
  end

  private

  def required_fields_present?
    [
      @fields['byr'],
      @fields['iyr'],
      @fields['eyr'],
      @fields['hgt'],
      @fields['hcl'],
      @fields['ecl'],
      @fields['pid']
    ].all?
  end
end

# Part 1 Solution
class PassportPart1 < Passport
  def valid?
    required_fields_present?
  end
end

# Part 2 Solution
class PassportPart2 < Passport
  def valid?
    return false unless required_fields_present?

    [
      valid_birthday?,
      valid_issue_year?,
      valid_expiration_year?,
      valid_height?,
      valid_hair_color?,
      valid_eye_color?,
      valid_passport_id?
    ].all?
  end

  private

  def valid_birthday?
    (1920..2002).cover?(@fields['byr'])
  end

  def valid_issue_year?
    (2010..2020).cover?(@fields['iyr'])
  end

  def valid_expiration_year?
    (2020..2030).cover?(@fields['eyr'])
  end

  def valid_hair_color?
    /#[0-9a-f]{6,6}$/.match?(@fields['hcl'])
  end

  def valid_eye_color?
    'amb blu brn gry grn hzl oth'.include?(@fields['ecl'])
  end

  def valid_passport_id?
    /^\d{9,9}$/.match?(@fields['pid'])
  end

  def valid_height?
    pattern = /^(?<height>\d+)(?<unit>in|cm)$/
    match = pattern.match(@fields['hgt'])
    return false unless match

    height = match['height'].to_i
    return (59..76).cover?(height) if match['unit'] == 'in'
    return (150..193).cover?(height) if match['unit'] == 'cm'
  end
end

def count_valid(klass)
  passports = [klass.new]
  File.foreach('inputs/day04.txt') do |line|
    line = line.chomp
    passports.append(klass.new) if line.empty?
    passports.last.add_line(line)
  end
  passports.count(&:valid?)
end

if $PROGRAM_NAME == __FILE__
  puts("#{count_valid(PassportPart1)} valid part01 passports found")
  puts("#{count_valid(PassportPart2)} valid part02 passports found")
end
