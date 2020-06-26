class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "travelingtraveler"
    end

    get '/'  do  
        erb :'/home'
    end 

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
            #binding.pry
            redirect to '/destinations'
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
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end



    helpers do
        def logged_in?
          !!current_user
        end

        def current_user
          User.find_by(id: session[:user_id])
        end
    end
   
end
