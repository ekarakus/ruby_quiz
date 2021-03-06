require_relative "question_class"
require "json"

module QuizFromFile

  def read_from_file
    question_list = Array.new
    begin
      File.open("data.json","r") do |file|
        data=file.read
        array=JSON.parse(data)
        #puts array
        array.each do |a|
          q= Question.new
          q.assign_from_hash(a)
          question_list.push(q)
        end
      end
    rescue =>ex
      puts "Error: #{ex.inspect}"
    end
    question_list
  end

  def write_to_file(list)
      begin
        hash_list=convert_object_list_to_hash(list)
        File.open("data.json", "w") { |f| f.write hash_list.to_json }
      rescue =>ex
        puts "Error: #{ex.inspect}"
      end
  end

  def convert_object_list_to_hash(list)
    hash_list = Array.new
    list.each {|x| hash_list << x.as_hash}
    hash_list
  end

  def check_file
    File.file?('data.json')
  end
  
end
