require_relative "file_module"
include QuizFromFile

def apply_quiz
  point=0
  questions=read_from_file()
  question_counter=1
  questions.each do |q|
    puts "\n#{question_counter.to_s}- #{q.question}"
    question_counter+=1
    q.options.each_with_index do |el,index|
      puts "#{index+1}) #{el}"
    end
    puts
    a=0
    loop do
      print "your answer is (1-4)"
      a=gets.chomp
      #checking whether is less than 5 and is numeric
      break if a.to_i<=4 && a==a.to_i.to_s
    end
    point+=1 if a.to_i==q.answer
  end
  puts "-"*80
  puts "your score is #{point}"
end

def add_question_to_quiz
  questions=read_from_file()
  loop do

    # question
    q=nil
    loop do
      puts "Please enter the question text"
      q=gets.chomp
      break if !q.strip.empty?
    end
    #options
    options=Array.new
    4.times do |i|
      loop do
        puts "Please enter the text of option ##{(i+1).to_s}"
        o=gets.chomp
        if  !o.strip.empty?
          options << o
          break
        end
      end
    end

    #answer
    correct_answer=0
    loop do
      print "Please enter the correct answer number (1-4):"
      correct_answer=gets.chomp
      #checking whether is less than 5 and is numeric
      break if correct_answer.to_i<=4 && correct_answer==correct_answer.to_i.to_s
    end

    #adding new question
    question=Question.new
    question.assign_params(q,options,correct_answer)
    questions.push(question)
    
    puts "\nDo you want to continue to add more? (y/n)"
    break if gets.chomp.strip!="y"
  end

  write_to_file(questions)
  puts "Your new question(s) has added to the quiz successfully."
end
