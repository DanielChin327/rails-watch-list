class BookmarksController < ApplicationController
def new
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  @list = List.find(params[:list_id])
  @bookmark.list = @list
  if @bookmark.save
    redirect_to list_path(@list)
  else
    render "lists/show", status: :unprocessable_entity
  end
end

def delete
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  redirect_to @bookmark.list
end

private

def set_list
  @list = List.find(params[:list_id])
end

def bookmark_params
  params.require(:bookmark).permit(:movie_id, :comment)
end

end
