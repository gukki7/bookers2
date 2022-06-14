class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def create
    @users = User.all
    @user = User.new(user_params)
  if @user.save
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
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
