module GistsHelper
  def question_url(question)
    link_to question.body.truncate(25), admin_question_path(question)
  end

  def gist_url(gist)
    link_to gist.gist_hash, gist.url, target: :blank
  end
end
