class DestinationsController  < ApplicationController

    get '/destinations' do #-READ
        if logged_in? 
            @destinations = current_user.destinations
            erb :'destinations/index'
        else 
            redirect '/'
        end 
    end 

    #get route for rendering form  for creating new destinations - CREATE
    get '/destinations/new' do 
        if logged_in? 
            erb :'destinations/new'
        else 
            redirect '/'
        end 
    end
    #post route for adding new destination to database, redirecting to '/destintions/:id' route to show new destination -CREATE
    post  '/destinations' do 
        if logged_in?
            if params[:location] == "" && params[:description] == "" && params[:activities] == ""
                redirect '/destinations/new'
            else 
                @destination = current_user.destinations.create(location: params[:location], description: params[:description], activities: params[:activities])
                if @destination.save
                    redirect "/destinations/#{@destination.id}"
                else 
                    redirect '/destinations/new'
                end 
            end 
        else 
            redirect '/'
        end 
    end 

    get '/destinations/:id' do #-READ
        if logged_in? 
            @destination = Destination.find_by_id(params[:id])
            if @destination && current_user.id == @destination.id 
                erb :'destinations/destination_show'
            else 
                redirect '/destinations'
            end 
        else 
            redirect '/'
        end 
    end 

    #get route for rendering destination edit form 
    get '/destinations/:id/edit' do 
        if logged_in?
            @destination = Destination.find_by_id(params[:id])
            if @destination && @destination.user_id == current_user.id
                erb :'/destinations/edit'
            else 
                redirect '/destinations'
            end 
        else 
            redirect '/'
        end 
    end 

    #post route for adding edited destination to database 
    patch '/destinations/:id' do 
        if logged_in? 
            if params[:location] == "" && params[:description] == "" && params[:activities] == ""
                redirect "/destinations/#{params[:id]}/edit"
            else 
                @destination = Destination.find_by_id(params[:id])
                if @destination && @destination.user_id == current_user.id
                    if @destination.update(location: params[:location], description: params[:description], activities: params[:activities])
                        redirect "/destinations/#{@destination.id}"
                    else 
                        redirect "/destinations/#{@destination.id}/edit"
                    end 
                end 
            end 
        else 
            redirect '/'
        end  
    end 


    #delete route for deleting a destination 
    delete '/destinations/:id/delete' do 
        if logged_in?
            @destination = Destination.find_by_id(params[:id])
            if @destination && @destination.user_id == current_user.id
                @destination.destroy
                redirect '/destinations'
            end 
        else 
            redirect '/'
        end 
    end

end 