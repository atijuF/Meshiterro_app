class ListsController < ApplicationController
  def new
    @list = List.new(list_params)
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
    @list.user_id = current_user.id
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  
    @post_comment = List.new
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id]) 
    list.destroy
    redirect_to '/lists'
  end
  
  private
  def list_params
    params.require(:list).permit(:shop_name, :image, :caption)
  end
end
