module TestPassagesHelper
  def message(test_passage)
    test_passage.passed? ? 'You passed!' : 'You screwed up'
  end

  def class_color(test_passage)
    test_passage.passed? ? 'text-success' : 'text-danger'
  end

  def result(test_passage)
    "You result is #{test_passage.result}%"
  end
end
