class SearchController < ApplicationController
  def index
    @query = Book.ransack(params[:q])
    @books = @query.result(distinct: true)
  end
end
