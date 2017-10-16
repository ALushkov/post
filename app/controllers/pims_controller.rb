class PimsController < ApplicationController
  before_action :find_pim, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @pims=Pim.all
  end

  def show

  end

  def new
    @pim = current_user.pims.build
  end

  def edit

  end

  def update
    if @pim.update(pim_params)
      redirect_to @pim, notice: "Pin updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pim.destroy
    redirect_to root_path
  end

  def upvote
    @pim.upvote_by current_user
    redirect_to pim_path
  end

  def create
    @pim = current_user.pims.build(pim_params)

    if @pim.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def pim_params
    params.require(:pim).permit(:title, :description, :image)
  end

  def find_pim
    @pim = Pim.find(params[:id])
  end

end
