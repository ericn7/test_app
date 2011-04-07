class ItemsController < ApplicationController
  def new
    @item = Item.new
    @title = "Create New Item"
  end
  
  def index
    @title = "All items"
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @title = @item.title
  end
  
  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:success] = "New Item Created!"
      redirect_to @item
    else
      @title = "Create New Item"
      render 'new'
    end
  end
  
  def edit
    @item = Item.find(params[:id])
    @title = "Edit item"
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:success] = "Item updated."
      redirect_to @item
    else
      @title = "Edit item"
      render 'edit'
    end
  end
  
def sort
  params[:items].each_with_index do |id, index|  
    Item.update_all(['position=?', index+1], ['id=?', id])  
  end  
  render :nothing => true  
end 

def index  
  @items = Item.all(:order => 'position')  
end  

end
