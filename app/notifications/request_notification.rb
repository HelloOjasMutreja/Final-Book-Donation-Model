# To deliver this notification:
#
# RequestNotification.with(post: @post).deliver_later(current_user)
# RequestNotification.with(post: @post).deliver(current_user)

class RequestNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @book = Book.find(params[:request][:book_id])
    @request = Request.find(params[:request][:id])
    @user = User.find(@request.user_id)
    "#{@user.user_name} has requested for #{@book.title.truncate(10)}"
  end
  #
  def url
    book_path(Book.find(params[:request][:book_id]))
  end
end
