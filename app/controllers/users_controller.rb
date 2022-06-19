class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
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
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'successfully'
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
    @user = User.find(params[:id])
  end

  def new
    @book = Book.new
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introducition,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end
end
