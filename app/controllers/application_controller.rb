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

    helpers do
        def logged_in?
          !!current_user
        end

        def current_user
          User.find_by(id: session[:user_id])
        end

        def authenticate
            redirect '/' if !logged_in?
        end

        def authorize(destination)
            authenticate
            redirect '/destinations' if destination.user_id != current_user.id
        end

    end
end
