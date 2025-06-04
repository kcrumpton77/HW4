class EntriesController < ApplicationController
  before_action :authenticate_user
  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]
    @entry.save
    if params["image"]
      @entry.image.attach(params["image"])
    end
    
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
