class FeedsController < ApplicationController
  
  def notes
    @notes = Note.order("created_at desc").limit(20)
  end
end
