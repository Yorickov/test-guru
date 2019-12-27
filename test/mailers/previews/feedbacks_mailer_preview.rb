# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/feedbacks_mailer/feedback_message
  def feedback_message
    feedback_params = { name: 'Pete', email: 'fd.com', message: 'some text' }
    FeedbacksMailer.feedback_message(feedback_params)
  end
end
