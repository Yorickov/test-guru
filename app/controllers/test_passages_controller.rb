class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result
    if params[:value]
      @test_passage.test_time = params[:value]
      @test_passage.time_off
      @test_passage.save
    end

    render :result
  end

  def update
    @test_passage.accept!(params[:answer_ids], params[:timer])

    if @test_passage.completed?
      # TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      logger.debug params[:time_left]
      render :show
    end
  end

  def gist
    gist_question_service = GistQuestionService.new(
      @test_passage.current_question
    )
    response = gist_question_service.call

    flash_options =
      if gist_question_service.success?
        @gist = current_user.gists.new(gist_params(response))

        { notice: t('.success', url: response.html_url) } if @gist.save
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params(response)
    { question: @test_passage.current_question, gist_hash: response.id }
  end
end
