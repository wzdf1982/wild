require 'csv'
require 'json'
require 'yaml'

input = ARGV.shift
is_file = (input.nil? ? false : File.exist?(input))
file = is_file ? input : STDIN

doc = is_file ? CSV.read(file) : CSV.parse(file.read)
fields = doc.shift
records = Hash.new
doc.each_with_index do |row, i|
  record = Hash.new
  fields.each_with_index do |field, j|
    record[field] = row[j]
  end
  records["record_#{i}"] = record
end

flag = ARGV.shift unless input.nil?
flag ||= input || '--yaml'

case flag
when '--json' then
  puts records.to_json
else
  puts records.to_yaml
end
