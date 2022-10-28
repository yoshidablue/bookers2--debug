class SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "user"
      @records = User.search_for(@content,@method)
    else
      @records = Book.search_for(@content,@method)
    end
  end

  def search_tag
    @books = Book.search(params[:keyword])
  end

end
