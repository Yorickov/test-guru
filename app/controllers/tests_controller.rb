class TestsController < ApplicationController
  before_action :find_test, only: :start

  def index
    @tests = Test.ready.page(params[:page]).per(20)
  end

  def start
    current_user.tests << @test
    # redirect to test#show
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
