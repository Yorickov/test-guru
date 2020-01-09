module TestPassagesHelper
  def result_message(test_passage)
    message =
      if test_passage.passed?
        "<p class='text-success'>#{t('.passed')}</p>"
      elsif test_passage.expired?
        "<p class='text-danger'>#{t('.failed_time')}</p>"
      else
        "<p class='text-danger'>#{t('.failed')}</p>"
      end

    result = "<p>#{t('.result', result: test_passage.result)}</p>"

    timer_value =
      if test_passage.passed? && test_passage.test.timer?
        "<p>#{t('.timer_count', count: test_passage.timer_time)}<\p>"
      else
        ''
      end

    "#{message} #{result} #{timer_value}".html_safe
  end
end
