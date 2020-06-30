class UsersController < ApplicationController

    get '/signup' do
        if logged_in?  
            redirect to '/destinations'
        else 
            erb :'users/create_user'
        end 
    end 

    post '/signup' do 
        if params[:username] != "" && params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
            session[:user_id] = @user.id
            redirect to '/destinations/new'
        else 
            redirect '/signup'
        end 
    end  

    get '/login' do 
        if !logged_in?
            erb :'users/login' 
        else 
            redirect '/destinations'
        end
    end 
    
    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/destinations'
        else 
            redirect '/signup'
        end  
    end 

    get '/logout' do
        if logged_in?
          session.clear
          redirect to '/'
        else
          redirect to '/'
        end
    end
 
end 
