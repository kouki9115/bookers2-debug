class Favorite < ApplicationRecord

belongs_to :book
belongs_to :user

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.build(book_id: params[:book_id])
    favorite.save
    redirect_to books_path #←この行を削除
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    redirect_to books_path #←この行を削除
  end
  
end
