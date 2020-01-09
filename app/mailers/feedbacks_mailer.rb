class FeedbacksMailer < ApplicationMailer
  def feedback_message(feedback_params)
    @admin = Admin.first
    @user_name = feedback_params[:user_name]
    @email = feedback_params[:email]
    @message = feedback_params[:message]

    mail to: @admin.email, subject: t('.subject', email: @email)
  end
end
