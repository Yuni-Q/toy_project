class HomeController < ApplicationController
  def board
    @every_post = Post.all
  end
  def write
    
  end 
  def create
    new_post = Post.new
    new_post.title = params[:title]
    new_post.content = params[:content]
    new_post.save
    
    redirect_to "/"
  end
    # 이렇게도 작성 할 수 있음.
    # def create
    #     @title = params[:title]
    #     @content = params[:content]
        
    #     Post.create(
    #         title: @title,
    #         content: @content
    #         )
    # end
    def destroy
        @id = params[:id]
        post = Post.find(@id)
        post.destroy
        # 지울 글을 찾는다.
        # 해당 글을 제거한다.
    redirect_to "/"
    end
    def update
    @post = Post.find(params[:id])
      @id = @post.id
      @title = @post.title
      @content = @post.content
    end
    def change
      @post = Post.find(params[:id])
      @post.update(
        title: params[:title],
        content: params[:content]
        )
      redirect_to "/"
    end
end
