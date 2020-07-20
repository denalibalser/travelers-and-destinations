class DestinationsController  < ApplicationController
 
    get '/destinations/new' do 
        authenticate
        erb :'destinations/new'
    end

    post  '/destinations' do 
        if params[:location] != "" && params[:description] != "" && params[:activities] != ""
            authenticate
            @destination = current_user.destinations.create(location: params[:location], description: params[:description], activities: params[:activities])
            redirect "/destinations/#{@destination.id}"
        else 
            redirect to '/destinations/new'
        end 
    end 

    get '/destinations' do 
        authenticate
        @destinations = current_user.destinations
        erb :'destinations/index'
    end

    get '/destinations/:id' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        erb :'destinations/show'
    end 

    get '/destinations/:id/edit' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        erb :'/destinations/edit'
    end

    patch '/destinations/:id' do 
        @destination = Destination.find_by_id(params[:id])
        if params[:location] != "" && params[:description] != "" && params[:activities] != "" 
            authorize(@destination)
            @destination.update(location: params[:location], description: params[:description], activities: params[:activities])
            redirect "/destinations/#{@destination.id}" 
        else 
            redirect "/destinations/#{@destination.id}/edit"
        end 
    end 

    delete '/destinations/:id/delete' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        @destination.destroy
        redirect '/destinations'
    end 
           
end 