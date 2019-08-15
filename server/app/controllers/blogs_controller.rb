class BlogsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :destroy]

    def index
        @blogs = Blog.all()
    end

    def new
    end

    def create
        #@blog = Blog.new(blog_params)
        #@blog.user = current_user
        @blog = current_user.blogs.new(blog_params)
        #render plain: @blog.inspect
        #return 
        if (@blog.save!)
            redirect_to root_path
        else
            render plain: @blog.inspect
        end
    end

    def edit
        @newBlog = Blog.find(params[:id])
        if @newBlog.user.id != current_user.id
            redirect_to root_path
            return
        end
    end

    def update
        #render plain: params[:post].inspect
        #return 
        @newBlog = Blog.find(params[:id])
        if @newBlog.user.id != current_user.id
            redirect_to root_path
            return
        end
        if (@newBlog.update(blog_params))
            redirect_to @newBlog   
        else
            render "edit"
        end
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def destroy
        @blog = Blog.find(params[:id])
        if @blog.user.id != current_user.id
            redirect_to root_path
            return
        end
        @blog.destroy
        redirect_to root_path
    end

    private def blog_params
        params.require(:newBlog).permit(:title, :content)
    end

end
