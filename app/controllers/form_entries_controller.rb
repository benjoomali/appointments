class FormEntriesController < ApplicationController
  before_action :set_form_entry, only: %i[ show edit update destroy ]

  # GET /form_entries or /form_entries.json
  def index
    @form_entries = FormEntry.all
  end

  # GET /form_entries/1 or /form_entries/1.json
  def show
  end

  # GET /form_entries/new
  def new
    @form = Form.find(params[:form_id])
    @form_entry = FormEntry.new
    @form_entry.appointments.build
    
    
    # If Form is attached to calendar, create availabilities variable
    if @form.calendars.any?
      @availabilities = @form.calendars.first.availabilities
    end 
  end

  # GET /form_entries/1/edit
  def edit
    @appointments = Appointment.all
  end

  # POST /form_entries or /form_entries.json
  def create
    @form = Form.find(params[:form_id])
    @form_entry = @form.form_entries.new(form_entry_params)

    respond_to do |format|
      if @form_entry.save
        format.html { redirect_to forms_path, notice: "Form entry was successfully created." }
        format.json { render :show, status: :created, location: @form_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_entries/1 or /form_entries/1.json
  def update
    respond_to do |format|
      if @form_entry.update(form_entry_params)
        format.html { redirect_to @form_entry, notice: "Form entry was successfully updated." }
        format.json { render :show, status: :ok, location: @form_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_entries/1 or /form_entries/1.json
  def destroy
    @form_entry.destroy
    respond_to do |format|
      format.html { redirect_to form_entries_url, notice: "Form entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_entry
      @form_entry = FormEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_entry_params
      params.require(:form_entry).permit(:name, :email, :phone, :form_id, appointments_attributes:[:start_time, :end_time, :calendar_id])
    end
end
