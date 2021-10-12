class SchedulesController < ApplicationController
    require 'slotfinder/slotfinder.rb'
    before_action :set_schedule, only: %i[ show edit update destroy ]
  
    # GET /schedules or /form_entries.json
    def index
      @schedules = Schedule.all
    end
  
    # GET /schedules/1 or /schedules/1.json
    def show
    end
  
    # GET /schedules/new
    def new
      @schedule = Schedule.new
    end
  
    # GET /schedules/1/edit
    def edit
    end
  
    # POST /schedules or /schedules.json
    def create
      @schedule = Schedule.new(schedule_params)
  
      respond_to do |format|
        if @schedule.save
          appts = Slotfinder.get_slots( 
            for_range: @schedule.start_datetime..@schedule.end_datetime,
            slot_length_mins: 30,
            interval_mins: 30,
          )
          counter = 0
          appts.each do |appt|
            appointment = Appointment.create(start_time: appt[:start_time], end_time: appt[:end_time], bookable: true, calendar_id: @schedule.calendar_id, capacity: 1)
            counter += 1 if appointment.persisted?
          end 
          puts "Created #{counter} appointments"

          format.html { redirect_to schedules_path notice: "Schedule was successfully created." }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /schedules/1 or /schedules/1.json
    def update
      respond_to do |format|
        if @schedule.update(schedule_params)
          format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
          format.json { render :show, status: :ok, location: @schedule }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /schedules/1 or /schedules/1.json
    def destroy
      @schedule.destroy
      respond_to do |format|
        format.html { redirect_to schedules_url, notice: "Form entry was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_schedule
        @schedule = Schedule.find(params[:id])
      end

      def set_calendar
        @calendar = Calendar.find(params[:calendar_id])
      end
  
      # Only allow a list of trusted parameters through.
      def schedule_params
        params.require(:schedule).permit(:start_datetime, :end_datetime, :calendar_id)
      end
  end
  