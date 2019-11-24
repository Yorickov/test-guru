class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  rescue_from ActiveRecord::RecordNotFound, with:
    :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def new
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end

  def edit; end

  def update; end

  def destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'No such a question'
  end
end
