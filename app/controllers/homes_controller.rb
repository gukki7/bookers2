class HomesController < ApplicationController
  def top
  end
  
  def about
   @homes = home.all
  end
end
