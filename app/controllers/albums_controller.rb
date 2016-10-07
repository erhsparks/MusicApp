class AlbumsController < ApplicationController
  before_action :require_login

  def new
    @album = Album.new

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages

      render :new
    end
  end

  def show
    @album = Album.find(params[:id])

    render :show
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)

    redirect_to album_url(album)
  end

  def destroy
    album = Album.find(params[:id])
    band = album.band

    album.destroy

    redirect_to band_url(band)
  end

  private
  def album_params
    params.require(:album).permit(:title, :live, :band_id)
  end
end
