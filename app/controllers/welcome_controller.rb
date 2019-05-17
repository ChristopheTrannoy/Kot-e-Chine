class WelcomeController < ApplicationController
  def index
    @events = Event.all
    @date = Time.new
  end
end
