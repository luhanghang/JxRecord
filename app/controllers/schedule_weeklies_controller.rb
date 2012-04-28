class ScheduleWeekliesController < ApplicationController
  def index 
  	@gateways = Gateway.find(:all)
  end
  
  def create
    address = request.remote_ip
    gateway = Gateway.find_by_address(address)
    unless gateway
    	gateway = Gateway.new 
    	gateway.address = address
    	gateway.port = 7000
    	gateway.save
    end
    spot = gateway.spots.find_by_seq(params[:spot])
    unless spot
    	spot = Spot.new 
    	spot.seq = params[:spot]
    	gateway.spots << spot
    end
    
    days = params[:days].split(',')
    days.each do |day|
      rs = ScheduleWeekly.new(params[:Schedule])
      rs.week_day = day
      spot.schedule_weeklies << rs
      add_action(rs,0)
    end
    @schedules = spot.schedule_weeklies
    render :action => "list.builder"
  end

  def list
    gateway = Gateway.find_by_address(request.remote_ip)
    @schedules = []
    if gateway
    	spot = gateway.spots.find_by_seq(params[:id])
    	if spot
    		@schedules = spot.schedule_weeklies
    	end
    end
  end

  def update
    s = ScheduleWeekly.find(params[:id])
    s.update_attributes(params[:Schedule])
    s.save
    add_action(s,1)
    render :text => 'ok'
  end

  def destroy
    s = ScheduleWeekly.find(params[:id])
    add_action(s,2)
    s.destroy()
    render :text => 'ok'
  end
  
  def add_action(schedule,type)
  	action = ActionWeekly.new
  	action.action_type = type 
  	spot = schedule.spot
  	action.spot_id = spot.id
  	action.gateway_id = spot.gateway.id
  	schedule.action_weeklies << action
  end
  
  def destroy_all
    address = request.remote_ip
    gateway = Gateway.find_by_address(address)
    spot = gateway.spots.find_by_seq(params[:id])
    spot.schedule_weeklies.each do |s|
    	add_action(s,2)
    	s.destroy
    end
    render :text => 'ok'
  end
  
  def actions
  	@gateways = Gateway.find(:all)
  end
end
