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
    ![
      @fields['byr'],
      @fields['iyr'],
      @fields['eyr'],
      @fields['hgt'],
      @fields['hcl'],
      @fields['ecl'],
      @fields['pid']
    ].include? nil
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
    @fields['byr'] >= 1920 and @fields['byr'] <= 2002
  end

  def valid_issue_year?
    @fields['iyr'] >= 2010 and @fields['iyr'] <= 2020
  end

  def valid_expiration_year?
    @fields['eyr'] >= 2020 and @fields['eyr'] <= 2030
  end

  def valid_hair_color?
    !/#[0-9a-f]{6,6}$/.match(@fields['hcl']).nil?
  end

  def valid_eye_color?
    'amb blu brn gry grn hzl oth'.split.include?(@fields['ecl'])
  end

  def valid_passport_id?
    !/^\d{9,9}$/.match(@fields['pid']).nil?
  end

  def valid_height?
    pattern = /^(?<height>\d+)(?<unit>in|cm)$/
    match = pattern.match(@fields['hgt'])
    return false if match.nil?

    height = match['height'].to_i
    return (height >= 59 and height <= 76) if match['unit'] == 'in'
    return (height >= 150 and height <= 193) if match['unit'] == 'cm'
  end
end

if $PROGRAM_NAME == __FILE__
  passports = [PassportPart1.new]
  File.foreach('inputs/day04.txt') do |line|
    line = line.chomp
    passports.append(PassportPart1.new) if line.empty?
    passports.last.add_line(line)
  end
  valid_count = 0
  passports.each do |p|
    valid_count += 1 if p.valid?
  end
  puts("#{valid_count} valid part01 passports found")

  passports = [PassportPart2.new]
  File.foreach('inputs/day04.txt') do |line|
    line = line.chomp
    passports.append(PassportPart2.new) if line.empty?
    passports.last.add_line(line)
  end
  valid_count = 0
  passports.each do |p|
    valid_count += 1 if p.valid?
  end
  puts("#{valid_count} valid part02 passports found")
end
