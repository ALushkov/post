class PimsController < ApplicationController
  before_action :find_pim, only: [:show, :edit, :update, :destroy]

  def index
    @pims=Pim.all
  end

  def show

  end

  def new
    @pim=Pim.new
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

  def create
    @pim=Pim.new(pim_params)

    if @pim.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def pim_params
    params.require(:pim).permit(:title, :description)
  end

  def find_pim
    @pim = Pim.find(params[:id])
  end

end
