class BlogsController < ApplicationController
    def new
    end

    def create
        #@blog = Blog.new(blog_params)
        #@blog.user = current_user
        @blog = current_user.blogs.new(blog_params)
        #render plain: @blog.inspect
        #return 
        if (@blog.save!)
            render plain: "OK"
            #redirect_to 
        else
            render plain: @blog.inspect
        end
    end

    def edit
    end

    def update
    end

    def show
    end

    def delete
    end

    private def blog_params
        params.require(:newBlog).permit(:title, :content)
    end

end
