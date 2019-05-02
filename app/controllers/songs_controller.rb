class SongsController < ApplicationController
    before_action :get_song, only: [:show, :edit, :update]
  
  def index 
    @songs = Song.all 
  end
  
  def new 
    @song = Song.new 
  end
  
  def create
    @song = Song.create(song_params) 
    redirect_to @song
  end
  
  def update 
    @song.update(song_params)
    redirect_to @song
  end
  
  def destroy 
    Artist.destroy(params[:id])
    redirect_to songs_path
  end
  
  private 
  
  def get_song
    @song = Song.find(params[:id])
  end
  
  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
