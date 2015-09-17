class EventsController < ApplicationController
	before_action :find_event, only: [:show, :update, :edit, :destroy]

	def new
		@event = Event.new
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
		attendance = Attendance.where(user_id: current_user.id, event_id: params[:id]).first
		if !attendance.present?
			attendance = Attendance.new
			attendance.user_id = current_user.id
			attendance.event_id = params[:id]
			attendance.attendance_status = 0
			attendance.save
		end
		render locals: {
			selected_status: attendance.attendance_status
		}
	end

	def update
	end

	def edit
	end

	def destroy
	end

	def index
		@events = Event.all
	end

	def update_user_attendance
		attendance_status = params[:attendance][:attendance_status].to_i
		attendance = Attendance.where(user_id: current_user.id, event_id: params[:event_id]).first
		attendance.attendance_status = attendance_status
		attendance.save
		redirect_to event_path(params[:event_id])
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :address, :homepage, :phonenumber)
	end

	def find_event
		@event = Event.find(params[:id])
	end

end
