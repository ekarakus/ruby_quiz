require_relative "quiz_module"
include QuizFromFile
def apply_quiz
  point=0
  questions=read_from_file()
  questions.each do |q|
    puts q.question
    q.options.each_with_index do |el,index|
      puts "#{index+1}) #{el}"
    end
    puts
    print "your anser is (1-4)"
    a=gets.chomp.to_i
    point+=1 if a==q.answer
  end
  puts "-"*80
  puts "your score is #{point}"
end
def add_question_to_quiz
  options=Array.new
  puts "Please enter the question text"
  q=gets.chomp
  4.times do |i|
    puts "Please enter the option #{(i+1).to_s}"
    options << gets.chomp
  end
  puts "Please enter the correct answer number (1-4) "
  c=gets.chomp.to_i

  questions=read_from_file()
  question=Question.new
  question.assign_params(q,options,c)
  questions.push(question)
  write_to_file(questions)
end
def main
  puts "1 apply quiz"
  puts "2 add a new question to the quiz"
  print "Please make a choice..:"
  case gets.chomp.to_i
  when 2
    add_question_to_quiz
  when 1
    apply_quiz
  end
end

main
