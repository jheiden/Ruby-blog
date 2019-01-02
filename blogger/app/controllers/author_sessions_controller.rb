class AuthorSessionsController < ApplicationController

    # <new> method renders related form in this case => the login form
    def new

    end

    # <create> methods accepts submission of that form
    def create
        # If login is successful => redirect to index / if trying to access restric. page redirect back
        if login(params[:email], params[:password])
            redirect_back_or_to(articles_path, notice: 'Logged in successfully!')
        else
        # If login fails notice user and render a new login form and let them try again
            flash.now.alert = "Login failed!"
            render action: :new
        end
    end

    # <destroy> method calls the logout function provided by sorcery and then redirects
    def destroy
        logout
        redirect_to(:authors, notice: 'Logged out!')
    end
end
