class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    respond_to do |format|
      format.js
    end
  end

  # GET /events/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @day = @event.due_date.strftime('%F')
    @meetings = Event.on_this_day(@day)
    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
        format.js
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/events/event_error.js.erb" }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @day = @event.due_date.strftime('%F')
        @meetings = Event.on_this_day(@day)
        format.json { render :show, status: :ok, location: @event }
        format.js
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/events/event_error.js.erb" }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :body, :due_date, :completed)
    end
end
