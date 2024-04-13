class ListsController < ApplicationController
  def new
    @list = list.new
  end
  
  def create
    @list = list.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @lists = list.all
  end

  def show
    @list = list.find(params[:id])  
  end

  def edit
    @list = list.find(params[:id])
  end
  
  def update
    list = list.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = list.find(params[:id]) 
    list.destroy
    redirect_to '/lists'
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
