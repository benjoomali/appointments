class DashboardsController < ApplicationController
    def index 
        @calendar = Calendar.first
        @appointments = @calendar.appointments.current_month
        @availabilities = @calendar.availabilities.current_month
        @forms = @calendar.forms.all
    end 
end
