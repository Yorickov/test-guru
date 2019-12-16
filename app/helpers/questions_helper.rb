module QuestionsHelper
  def question_header(question)
    question.persisted? ? t('.header_edit') : t('.header_create')
    # "#{prefix} #{question.test.title}"
  end
end
