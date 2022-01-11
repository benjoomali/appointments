class DashboardsController < ApplicationController
    def index 
        @appointments = Appointment.all 
        @availabilities = Availability.all
        @calendars = Calendar.all
        @forms = Form.all
    end 
end
