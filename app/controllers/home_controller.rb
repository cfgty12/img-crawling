class HomeController < ApplicationController
  def index
   @ponies = Pony.all
  end
end
