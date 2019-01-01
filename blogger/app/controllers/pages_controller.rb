class PagesController < ApplicationController
    def about
        @title = "About this page"
        @content = "This page was created by Johan Heidenberg as a part of the odins project curriculum"
    end

end
