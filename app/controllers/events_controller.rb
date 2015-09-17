class EventsController < ApplicationController
	before_action :find_event, only: [:show, :update, :edit, :destroy]

	def new
	end

	def create
		@event = Event.new(event_params)
		# current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def show
	end

	def update
	end

	def edit
	end

	def destroy
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :address, :homepage, :phonenumber)
	end

	def find_event
		@event = Event.find(params[:id])
	end

end
