class TagsController < ApplicationController
   
    # Protecting just the <destroy> method (users need to be logged in prior to deleting tags)
    before_action :require_login, only: [:destroy]

    def show
        @tag = Tag.find(params[:id])
    end

    def index
        @tags = Tag.all
    end

    def destroy
        @tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag '#{@tag.name}' Destroyed!"
		redirect_to tags_path
    end
end
