require_relative "quiz"
def main
  begin
    raise "Data file not found" if !check_file
    puts "1 apply quiz"
    puts "2 add a new question to the quiz"
    print "Please make a choice..:"
      case gets.chomp.to_i
        when 2
          add_question_to_quiz
        when 1
          apply_quiz
      end
    rescue =>ex
      puts "Error: #{ex.inspect}"
    end
end

main
