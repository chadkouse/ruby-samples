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
    attr_accessor :headers, :csv_contents

    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow[@headers.zip(row.chomp.split(', '))]
      end
    end

    def each (&block)
      @csv_contents.each &block
    end

    def initialize
      read
    end
  end
end

class CsvRow < Hash
  def method_missing(name, *args)
    self["#{name}"]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each { |stuff| puts "#{stuff.name} - #{stuff.kids}"}
