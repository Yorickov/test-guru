module QuestionsHelper
  def question_header(question)
    prefix = question.persisted? ? 'Edit' : 'Create New'
    "#{prefix} #{question.test.title} Question"
  end
end
