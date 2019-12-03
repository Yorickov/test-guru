module TestPassagesHelper
  def result_message(test_passage)
    message =
      if test_passage.passed?
        "class='text-success'>You passed!"
      else
        "class='text-danger'>You screwed up."
      end

    "<p #{message} You result is #{test_passage.result}</p>".html_safe
  end
end
