class AvailabilitiesController < ApplicationController 
    require 'slotfinder/slotfinder.rb'
    before_action :set_availability, only: %i[ show edit update destroy ]
    before_action :get_slots, only: %i[ show edit update destroy ]

def index 
    @availabilities = Availability.all
end 

def show 
end 

def new
    @availability = Availability.new
end

def create
    @availability = Availability.new(availability_params)

    respond_to do |format|
        if @availability.save
            format.html { redirect_to availabilities_path, notice: "availability was successfully created." }
        else
            format.html { render :new, status: :unprocessable_entity }
        end
    end
end

  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: "Availability was successfully updated." }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: "Availability was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_slots
    @appts = Slotfinder.get_slots( 
      for_range: @availability.start_time..@availability.end_time,
      slot_length_mins: @availability.calendar.interval,
      interval_mins: @availability.calendar.interval,
    )
  end


# Use callbacks to share common setup or constraints between actions.
def set_availability
  @availability = Availability.find(params[:id])
end

def set_calendar
  @calendar = Calendar.find(params[:calendar_id])
end

# Only allow a list of trusted parameters through.
def availability_params
  params.require(:availability).permit(:start_time, :end_time, :calendar_id)
end

end