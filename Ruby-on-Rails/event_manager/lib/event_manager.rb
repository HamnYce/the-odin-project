# Frozen_String_Literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

puts 'EventManager initialized.'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')
end

def clean_homephone(homephone)
  homephone.gsub!(/\D/, '')
  return 0 unless homephone.length.between?(10, 11)
  return homephone.slice(1..) if homephone.length == 11 && homephone[0] == '1'

  homephone
end

def clean_reg_time(regdate)
  reg_time = regdate.split[1].split(':')[0]
end

def clean_reg_date(regdate)
  reg_date = regdate.split[0].split('/')
  reg_date[2] = "20#{reg_date[2]}" if reg_date[2][0].to_i.between?(0, 2)
  reg_date.join('/')
end

def legislator_by_zipcode(civic_info, zipcode)
  begin
    civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/
    take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') { |file| file.puts form_letter}
end

time_hash = {}
date_hash = {}

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(civic_info, zipcode)
  homephone = clean_homephone(row[:homephone])

  reg_time = clean_reg_time(row[:regdate])
  time_hash[reg_time] = 0 unless time_hash.key? reg_time
  time_hash[reg_time] += 1

  reg_date = clean_reg_date(row[:regdate])
  reg_date = date.strptime(reg_date, '%m/%d/%y')
  day = reg_date.wday
  date_hash[day] = 0 unless date_hash.key? day
  date_hash[day] += 1
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
end
puts time_hash
puts date_hash

puts 'EventManager deactivated'
