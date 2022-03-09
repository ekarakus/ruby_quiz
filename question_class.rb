class Question
  attr_accessor :question,:options,:answer
  def assign_params(question,options,answer)
      @question=question
      @options=options
      @answer=answer
  end
  def assign_from_hash(hashed_object)
     @question=hashed_object["question"]
     @options=hashed_object["options"]
     @answer=hashed_object["answer"]
  end

  def as_hash
    hash = self.instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
    hash
  end
end
