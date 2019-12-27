class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    FeedbacksMailer.feedback_message(feedback_params).deliver_now
    redirect_to root_path, notice: t('.succeess')
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_name, :email, :message)
  end
end
