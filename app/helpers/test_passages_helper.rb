module TestPassagesHelper
  def result_message(test_passage)
    message =
      if test_passage.passed?
        "<p class='text-success'>#{t('.passed')}</p>"
      else
        "<p class='text-danger'>#{t('.failed')}</p>"
      end

    result = "<p>#{t('.result', result: test_passage.result)}</p>"
    "#{message} #{result}".html_safe
  end
end
