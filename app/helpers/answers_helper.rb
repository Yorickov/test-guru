module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? t('.header_edit') : t('.header_create')
  end
end
