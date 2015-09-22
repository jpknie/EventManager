class EventsController < ApplicationController
	before_action :find_event, only: [:show, :update, :edit, :destroy]

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def show
<<<<<<< HEAD
		attendance = Attendance.where(user: current_user, event_id: @event.id).first
		if !attendance.present?
			attendance = Attendance.new
			attendance.user = current_user
			attendance.event = @event
			attendance.attendance_status = 0
			attendance.save
		end
		location = @event.location
		belongs_to_me = @event.user == current_user
		attendants = User.joins(:attendances).where(attendances: { event_id: @event.id, attendance_status: Attendance::STATUSES.rindex("Yes")})
>>>>>>> d9d46d91b13ec5a9ea2f2db76f1463335de3a532
		render locals: {
			attendants: attendants,
			belongs_to_me: belongs_to_me,
			selected_status: attendance.attendance_status,
			location: location
		}
	end

	def update
		if @event.user == current_user
			if @event.update(event_params)
				redirect_to @event
			else
				render 'edit'
			end
		# Do not allow to update, redirect to event
		else
			redirect_to @event
		end
	end

	def edit
	end

	def destroy
		# Check that current user owns the event (created it), and then allow to destroy it
<<<<<<< HEAD
		if @event.user == current_user
			@event.destroy
=======
		if Event.where(user: current_user).first.present?
			event_id = params[:id]
			Event.destroy(event_id)
>>>>>>> d9d46d91b13ec5a9ea2f2db76f1463335de3a532
		end
		redirect_to events_path
	end

	def index
		@events = Event.all
	end

	def update_user_attendance
		attendance_status = params[:attendance][:attendance_status].to_i
		attendance = Attendance.where(user: current_user, event_id: params[:event_id]).first
		attendance.attendance_status = attendance_status
		attendance.save
		redirect_to event_path(params[:event_id])
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :location_id)
	end

	def find_event
		@event = Event.find(params[:id])
	end

end
