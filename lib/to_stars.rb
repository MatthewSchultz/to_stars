# frozen_string_literal: true

require_relative 'to_stars/version'

# Config options for the to_stars method
module ToStars
  # rubocop:disable Style/ClassVars, Style/ClassVars
  class Error < StandardError; end
  @@character = 9733.chr(Encoding::UTF_8)
  @@seperator = '/'
  @@out_of_format = :numeric
  @@out_of = nil

  def self.character=(value)
    @@character = value
  end

  def self.character
    @@character
  end

  def self.seperator=(value)
    @@seperator = value
  end

  def self.seperator
    @@seperator
  end

  def self.out_of_format=(value)
    @@out_of_format = value
  end

  def self.out_of_format
    @@out_of_format
  end

  def self.out_of=(value)
    @@out_of = value
  end

  def self.out_of
    @@out_of
  end
  # rubocop:enable Style/ClassVars, Style/ClassVars
end

# Adds to_stars to numeric
class Numeric
  def to_stars(options = {})
    char, seperator, out_of, out_of_format = parse_options_for_to_stars options

    string_output = ''
    times do |_t|
      string_output += char
    end
    unless out_of.nil?
      string_output += seperator
      case out_of_format
      when :character
        out_of.times do |_t|
          string_output += char
        end
      when :one_and_numeric
        string_output += out_of.to_s
        string_output += char
      when :numeric
        string_output += out_of.to_s
      end
    end
    string_output
  end
  alias stars to_stars

  private

  def parse_options_for_to_stars(options)
    [
      options.delete(:character) || ToStars.character,
      options.delete(:seperator) || ToStars.seperator,
      options.delete(:out_of) || ToStars.out_of,
      options.delete(:out_of_format) || ToStars.out_of_format
    ]
  end
end
