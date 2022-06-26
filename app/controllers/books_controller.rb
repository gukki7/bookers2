class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    redirect_to book_path(@book_new.id) , notice: 'successfully'
    else
    @books = Book.all
    @user = current_user
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

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    if book.delete
    redirect_to books_path,
    notice: 'successfully'
    else
    render :index
    end
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
