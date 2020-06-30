class DestinationsController  < ApplicationController
 
    #get route for rendering form  for creating new destinations - CREATE
    get '/destinations/new' do 
        authenticate
        erb :'destinations/new'
    end
    #post route for adding new destination to database, redirecting to '/destintions/:id' route to show new destination -CREATE
    post  '/destinations' do 
        authenticate
        @destination = current_user.destinations.create(location: params[:location], description: params[:description], activities: params[:activities])
        redirect "/destinations/#{@destination.id}"
    end 

    get '/destinations' do #-READ
        authenticate
        @destinations = current_user.destinations
        erb :'destinations/index'
    end

    get '/destinations/:id' do #-READ
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        erb :'destinations/destination_show'
    end 

    #get route for rendering destination edit form -UPDATE
    get '/destinations/:id/edit' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        erb :'/destinations/edit'
    end

    #post route for adding edited destination to database -UPDATE
    patch '/destinations/:id' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        @destination.update(location: params[:location], description: params[:description], activities: params[:activities])
        redirect "/destinations/#{@destination.id}" 
    end 


    #delete route for deleting a destination -DELETE
    delete '/destinations/:id/delete' do 
        @destination = Destination.find_by_id(params[:id])
        authorize(@destination)
        @destination.destroy
        redirect '/destinations'
    end 
           
end 