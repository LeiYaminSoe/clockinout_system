class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:show, :edit, :update, :destroy]

  @@clock_event_cls = ClockEvent.new

  # GET /clock_events
  # GET /clock_events.json
  def index
    @user = User.find(session[:user_id])
    @clock_event = ClockEvent.new
    @clock_events = @user.clock_events.page(params[:page]).per(5).order('clock_events.event_time DESC')
  end

  def report
    @q = ClockEvent.ransack(params[:q])
    @clk_events = @q.result.page(params[:page]).per(5).order('clock_events.event_time DESC')
  end

  def search
    @q = ClockEvent.ransack(params[:q])
    @clk_events = @q.result.page(params[:page]).per(5).order('clock_events.event_time DESC')
  end

  # GET /clock_events/1
  # GET /clock_events/1.json
  def show
    @user = User.find(session[:user_id])
    @clock_events = @user.clock_events.page(params[:page]).per(5).order('clock_events.event_time DESC')
    @clock_event = ClockEvent.new
  end

  # GET /clock_events/new
  def new
    @user = User.find(session[:user_id])
    @clock_event = @@clock_event_cls
    @clock_events = @user.clock_events.page(params[:page]).per(5).order('clock_events.event_time DESC')
    @@clock_event_cls = ClockEvent.new
  end

  # GET /clock_events/1/edit
  def edit
    @clock_event = ClockEvent.find(params[:id])
    @user = User.find(@clock_event.user_id)
    @clock_events = @user.clock_events.page(params[:page]).per(5).order('clock_events.event_time DESC')
  end

  # POST /clock_events
  # POST /clock_events.json
  def create
    @clock_event = ClockEvent.new(clock_event_params)
    respond_to do |format|
      if @clock_event.save
        format.html { redirect_to @clock_event, notice: 'Clock event was successfully created.' }
        format.json { render :show, status: :created, location: @clock_event }
      else
        @@clock_event_cls = @clock_event
        format.html { redirect_to :new_clock_event }
        format.json { render json: @clock_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clock_events/1
  # PATCH/PUT /clock_events/1.json
  def update
    respond_to do |format|
      if @clock_event.update(clock_event_params)
        format.html { redirect_to @clock_event, notice: 'Clock event was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock_event }
      else
        format.html { render :edit }
        format.json { render json: @clock_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clock_events/1
  # DELETE /clock_events/1.json
  def destroy
    @clock_event.destroy
    redirect_to clock_events_path(user: @clock_event.user_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clock_event
    @clock_event = ClockEvent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clock_event_params
    params.require(:clock_event).permit(:id, :user_id, :event_type, :event_action, :event_time, :created_at, :updated_at )
  end
end
