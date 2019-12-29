class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.page(params[:page]).per(20)
  end
end
