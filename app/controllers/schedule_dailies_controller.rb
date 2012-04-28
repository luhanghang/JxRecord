class ScheduleDailiesController < ApplicationController
  def index 
  	@gateways = Gateway.find(:all)
  end
  
  def list
    gateway = Gateway.find_by_address(request.remote_ip)
    if gateway
    	spot = gateway.spots.find_by_seq(params[:id])
    	if spot
    		@schedules = spot.schedule_dailies
    	end
    end
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
    
    @schedule = ScheduleDaily.new(params[:Schedule])
    spot.schedule_dailies << @schedule
    add_action(@schedule,0)
  end

  def update
    s = ScheduleDaily.find(params[:id])
    s.update_attributes(params[:Schedule])
    s.save
    add_action(s,1)
    render :text => 'ok'
  end

  def destroy
    s = ScheduleDaily.find(params[:id])
    add_action(s,2)
    s.destroy()
    render :text => 'ok'
  end

  def destroy_all
  	address = request.remote_ip
    gateway = Gateway.find_by_address(address)
    spot = gateway.spots.find_by_seq(params[:id])
    date = params[:date]
    schedules = spot.schedule_dailies.find_all_by_schedule_date(date)
    schedules.each do |s|
    	add_action(s,2)
    	s.destroy
    end
    render :text => date
  end
  
  def add_action(schedule,type)
  	action = ActionDaily.new
  	action.action_type = type 
  	spot = schedule.spot
  	action.spot_id = spot.id
  	action.gateway_id = spot.gateway.id
  	schedule.action_dailies << action
  end
  
  def actions
  	@gateways = Gateway.find(:all)
  end
end
