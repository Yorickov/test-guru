class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def new
  end

  def create
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
end
