class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[update_inline]
  before_action :find_test,
                only: %i[show edit update destroy start update_inline]

  def index
    @tests = Test.page(params[:page]).per(20)
  end

  def new
    @test = current_user.own_tests.new
  end

  def create
    @test = current_user.own_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success') # !!!!!
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
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

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
