class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new 
        
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Access granted"
            redirect_to root_path
        else
            flash.now[:error] = "idiot, you did something wrong... I mean \"Access Denied\""
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "When you walk on by, will you call my name"
        redirect_to root_path
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:error] = "Why would you try to do that?"
            redirect_to root_path
        end
    end

end