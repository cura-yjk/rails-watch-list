class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create ]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # Associate the newly instantiated bookmark with the parent list
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: "Movie was successfully added to your list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/:id
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy

    redirect_to list_path(@list), status: :see_other, notice: "Movie removed from list."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
