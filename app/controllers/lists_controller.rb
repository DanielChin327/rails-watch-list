class ListsController < ApplicationController



def index
  @lists = List.all
end

def show
  @list = List.find(params[:id])
  @bookmarks = @list.bookmarks

  # This bookmark is for the form
  @bookmark = Bookmark.new
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to lists_path
  else
    render :show, status: :unprocessable_entity
  end
end

private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
