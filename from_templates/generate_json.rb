
unless defined?(::JSON::JSON_LOADED) and ::JSON::JSON_LOADED
  require 'json'
end

#! /usr/bin/env ruby

require 'date'
require 'json'
require 'FileUtils'

class DateTime
  def as_json(*)
    strftime "%Y-%m-%d"
  end

  def to_json(*args)
    as_json.to_json(*args)
  end
end

def first_of_month(date) return DateTime.parse(date.strftime("%Y-%m-01")); end
def first_of_year(date) return DateTime.parse(date.strftime("%Y-01-01")); end

def first_of_next_month(date) return first_of_month(date >> 1); end

def add_days(date, days) return date.next_day(days); end
def add_months(date, months) return date.next_month(months); end
def add_weeks(date, weeks) return date.next_day(weeks*7); end
def add_years(date, years) return date.next_year(years); end

now = DateTime.now
date = first_of_next_month(now)


def processString(str, date)
  #puts "processing string: " + str
  begin

    #re_date =/@(date|month|year)(\.(add_days|add_weeks|add_months|add_years)' '+([0-9]+))?/
    re_date =/@(date|month|year)(\.(add_days|add_weeks|add_months|add_years)[[:space:]](\-?[0-9]+))?/
    m = re_date.match str
    if m
      if m[1] == "date"
        output_date = date
      elsif m[1] == "month"
        output_date = first_of_month date
      elsif m[1] == "year"
        output_date = first_of_year date
        puts ";;;;;;YEAR: " + output_date.iso8601
      end

      if (m[2] == nil)
        return output_date
      else
        if (m[3] == "add_days")
          return add_days output_date, Integer(m[4])
        elsif (m[3] == "add_weeks")
          return add_weeks output_date, Integer(m[4])
        elsif (m[3] == "add_months")
          return add_months output_date, Integer(m[4])
        elsif (m[3] == "add_years")
          return add_years output_date, Integer(m[4])
        end
      end
    else
      re_days = /@days\(([0-9]+|\"[^"]*\")\)/
      m = re_days.match str
      if m
        days = Integer(m[1])
        adjusted_date = date.next_day(days)
        return adjusted_date.iso8601
      else
        re_eval = /@eval\(\"([^"]*)\"\)/
        m = re_eval.match str
        if m
          result = eval m[1]
          if result.class.name == "DatetTime"
            result = result.iso8601
          end
          return result
        else
          return str
        end
      end
    end
  rescue Exception => e
    STDERR.puts "Exception processing string: " + str
    STDERR.puts e.message
    STDERR.puts e.backtrace.inspect
    exit 5
  end
end

def processArray(object, date)
  object.map! do |value|
    #puts "--------array member type: " + value.class.name
    if value.class.name == "String"
      processString value, date
    elsif value.class.name == "Hash"
      processJsonData value, date
    elsif value.class.name == "Array"
      processArray value, date
    else
      value
    end
  end
end

def processJsonData(object, date)
  object.each { |key, value|
    #puts "........hash member type: " + value.class.name
    if value.class.name == "Hash"
      object[key] = processJsonData value, date
    elsif value.class.name == "Array"
      object[key] = processArray value, date
    elsif value.class.name == "String"
      object[key] = processString value, date
    else
      value
    end
  }
end

def processFile(src, dest, date)
  begin
    contents = File.read(src)
    object = JSON.parse(contents)
    processedContents = processJsonData(object, date)
    File.write(dest, JSON.pretty_generate(processedContents))
  rescue Exception => e
    STDERR.puts "Exception processing: " + src
    STDERR.puts e.message
    STDERR.puts e.backtrace.inspect
    exit 5
  end
end

def processDirectory(src, dest, date)
  Dir.chdir(src)
  Dir.glob("*") do |item|
    source_item = File.join(src, item)
    destination_item = File.join(dest, item)
    if File.file?(source_item)
      processFile(source_item, destination_item, date)
    end
    if File.directory?(source_item)
      if !Dir.exist?(destination_item)
        Dir.mkdir(destination_item)
      end
      processDirectory(source_item, destination_item, date)
      Dir.chdir(src)
    end
  end
end


def processDirectories(src, dest, date)
  puts "source: " + src
  puts "destination: " + dest
  Dir.chdir(src)
  Dir.glob("*") do |item|
    source_item = File.join(src, item)
    destination_directory = File.join(dest, item)
    if File.file?(source_item)
      puts "Coping file: " + source_item
      puts "to: " + destination_directory
      FileUtils.copy(source_item, dest)
    elsif File.directory?(source_item)
      puts "Processings: " + destination_directory
      if !Dir.exist?(destination_directory)
        puts "Created destination directory: " + destination_directory
        Dir.mkdir(destination_directory)
      end
      begin
        processDirectory(source_item, destination_directory, date)
        Dir.chdir(src)
      rescue
        puts "Exception processing directory: " + destination_directory
        exit(5)
      end
    end
  end
end


@commandLine = "gettestdata.rb <src dir> <dest dir> <optional gen date>"

if ARGV.length < 2 || ARGV.length > 3
  puts @commandLine
  exit(3)
end

if File.directory?(ARGV[0]) then
  @src = ARGV[0]
else
  puts "src directory missing"
  puts @commandLine
  exit(1)
end


if File.directory?(ARGV[1]) then
  @dest = ARGV[1]
else
  puts "dest directory missing"
  puts @commandLine
  exit(2)
end

if ARGV.length == 2
  @date = DateTime.now.to_date
else
  @dateString = ARGV[2]
  @date = DateTime.iso8601(@dateString)
end

puts "using date: " + @date.to_s

processDirectories(File.expand_path(@src), File.expand_path(@dest), @date)
puts "Successfully processed templates"
exit(0)