# frozen_string_literal: true
require 'csv'

class Csv
  attr_accessor :path

  def initialize
    @path = 'lib/data.csv'
  end

  def save_to_csv(word_list)
    puts word_list.to_s
    CSV.open(path, 'a') do |csv|
      csv << word_list
    end
    puts 'Successfully added to CSV'
  end

  def read_from_csv
    CSV.parse(File.read(@path), converters: :all)
  end
end
