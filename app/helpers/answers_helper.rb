module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? 'Edit' : 'Create New'
  end
end
