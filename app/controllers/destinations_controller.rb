class DestinationsController  < ApplicationController

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
        @destination = Destination.create(location: params[:location], description: params[:description], activities: params[:activities])
        redirect  "/destinations/#{@destination.id}"
    end

    get '/destinations' do #-READ
        if logged_in?
            @destinations = Destination.all
            erb :'destinations/index'
        else 
            redirect '/'
        end 
    end 


    get '/destinations/:id' do #-READ
        @destination = Destination.find_by_id(params[:id])
        erb :'destinations/destination_show'
    end 

    #get route for rendering destination edit form 

    #post route for adding edited destination to database 

    #delete route for deleting a destination 
end 