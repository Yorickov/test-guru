class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

    response = GistQuestionService.new(
      @test_passage.current_question,
      client
    ).call

    flash_options =
      if client.last_response.status == 201
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
