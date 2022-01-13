class DashboardsController < ApplicationController
    def index 
        @calendar = Calendar.first
        @appointments = @calendar.appointments.all 
        @availabilities = @calendar.availabilities.all
        @forms = @calendar.forms.all
    end 
end
