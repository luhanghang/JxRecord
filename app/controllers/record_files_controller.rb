class RecordFilesController < ApplicationController
  def search
    from_date = params[:from_date]
    to_date = params[:to_date]
    spot = params[:id]
    conditions = "record_date >= '#{from_date}' and record_date <= '#{to_date}' and end_hour is not null"
    gateway = Gateway.find_by_address(request.remote_ip)
    spot = gateway.spots.find_by_seq(spot)
    @records = gateway.record_files.find_all_by_spot_id(spot,:conditions=>conditions)
  end

  def play
  	@host = request.host
    @record = RecordFile.find(params[:id])
    @startTime = "#{@record.record_date} #{Utils.date @record.start_hour}:#{Utils.date @record.start_min}"
    @title = "#{params[:spot_name]} #{@record.record_date} #{Utils.date @record.start_hour}:#{Utils.date @record.start_min}-#{Utils.date @record.end_hour}:#{Utils.date @record.end_min}"
  end
  
  def create 
  	spot = Spot.find_by_seq_and_gateway_id(params[:id],params[:gateway])
  	t = Time.new
  	start = params[:start].split(":")
  	endtime = params[:end].split(":")
  	record = RecordFile.new 
  	record.gateway_id = params[:gateway]
  	record.spot_id = spot.id
  	record.record_date = t.strftime("%Y-%m-%d") 
  	record.start_hour = start[0]
  	record.start_min = start[1]
  	record.end_hour = endtime[0]
  	record.end_min = endtime[1]
  	record.path_file = params[:file]
  	record.error = params[:error]
  	record.save
  	render :text => "ok" 
  end
end
