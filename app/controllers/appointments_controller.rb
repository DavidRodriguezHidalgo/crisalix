class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
  end

  def new
    @doctors = Doctor.all
  end

  def create
    if current_user.appointments.create(date: params["appointment"]["date"], doctor_id: params["appointment"]["doctor_id"])
      redirect_to appointments_path, notice: "Appointment created"
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])

    if @appointment.destroy
      redirect_to appointments_path, alert: "Appointment deleted"
    end
  end
end
