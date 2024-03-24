class BookmarksController < ApplicationController
before_action :set_bookmark, only: :destroy
before_action :set_list, only: [:new, :create]


def new
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  # @list = List.find(params[:list_id])
  @bookmark.list = @list
  if @bookmark.save
    redirect_to list_path(@list)
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
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
