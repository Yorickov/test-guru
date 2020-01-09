require 'test_helper'

class FeedbacksMailerTest < ActionMailer::TestCase
  test "feedback_message" do
    mail = FeedbacksMailer.feedback_message
    assert_equal "feedback_message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
