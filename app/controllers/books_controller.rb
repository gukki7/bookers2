class BooksController < ApplicationController

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id) , notice: 'successfully'
    else
    render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'successfully'
    else
    render :edit
    end
  end
end
