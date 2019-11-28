module QuestionsHelper
  def question_header(title, question)
    prefix = question.id ? 'Edit' : 'Create New'
    "#{prefix} #{title} Question"
  end
end
