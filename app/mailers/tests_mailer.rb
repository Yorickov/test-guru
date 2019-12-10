class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subjest: 'You just completed the TestGuru test'
  end
end
