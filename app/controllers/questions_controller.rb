class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with:
    :rescue_with_question_not_found

  def index
  end

  def new
  end

  def show
  end

  def edit; end

  def update; end

  def destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'No such a question'
  end
end
