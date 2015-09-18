class LocationsController < ApplicationController
	before_action :find_location, only: [:show, :update, :edit, :destroy]

	def new
		@location = Location.new
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			redirect_to @location
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @location.update(location_params)
			redirect_to @location
		else
			render 'edit'
		end
	end

	def edit
	end

	def destroy
		redirect_to locations_path
	end

	def index
		@locations = Location.all
	end

	private

	def location_params
		params.require(:location).permit(:name, :address, :homepage, :phonenumber)
	end

	def find_location
		@location = Location.find(params[:id])
	end

end
