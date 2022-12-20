class RequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_book

    def create
        @request = @book.requests.create(request_params)
        @request.user = current_user

        if @request.save
            flash[:notice] = "Request has been saved"
            redirect_to book_path(@book)
        else
            flash[:alert] = "Request has not been saved"
            redirect_to book_path(@book)        
        end
    end

    def destroy    
        @request = @book.requests.find(params[:id])
        @request.destroy
        redirect_to book_path(@book)
    end

    private
        def set_book
            @book = Book.find(params[:book_id])
        end

        def request_params
            params.require(:request).permit(:body)
        end
end
