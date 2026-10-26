
require "csv"
require "fileutils"

input = "replication/extension/dataset/survey_results_public.csv"
output = "replication/extension/rq1_learning_channels.csv"

professional = 0
valid = 0
counts = Hash.new(0)

CSV.foreach(input, headers: true) do |row|
  next unless row["MainBranch"] == "I am a developer by profession"

  professional += 1
  answer = row["LearnCode"]
  next if answer.nil? || answer.strip.empty? || answer.strip == "NA"

valid += 1

  answer.split(";").map(&:strip).uniq.each do |method|
    counts[method] += 1 unless method.empty?
  end
end

CSV.open(output, "w") do |csv|
  csv << ["learning_method", "count", "percentage"]

  counts.sort_by { |_, count| -count }.each do |method, count|
    percentage = (count * 100.0 / valid).round(2)
    csv << [method, count, percentage]
  end
end

puts "Professional developers: #{professional}"
puts "Valid LearnCode responses: #{valid}"
puts
puts "Learning methods:"

counts.sort_by { |_, count| -count }.each do |method, count|
  percentage = (count * 100.0 / valid).round(2)
  puts "#{method}: #{count} (#{percentage}%)"
end

puts
puts "Saved: #{output}"
