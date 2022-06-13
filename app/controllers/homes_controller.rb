class HomesController < ApplicationController
  def top
   @books = Book.all
  end
  
  def about
   @homes = home.all
  end
end
