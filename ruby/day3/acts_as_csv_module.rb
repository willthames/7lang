#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---

class CsvRow
  @row = {}

  def initialize(hash)
    @row = hash 
  end

  def method_missing(name, *args)
    if @row.has_key?(name.to_s)
      @row[name.to_s]
    else
      super
    end
  end

  def respond_to_missing?(name)
    @row.has_key?(name.to_s)
  end

  def to_s
    @row.to_s
  end
end
  

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each do |row| 
        hash = Hash[*@headers.zip(row).flatten]
        yield CsvRow.new(hash) 
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
m.each { |x| puts "#{x.first} #{x.last}: #{x.country}" }

