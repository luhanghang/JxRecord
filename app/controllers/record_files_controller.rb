class RecordFilesController < ApplicationController
  def search
    from_date = params[:from_date]
    to_date = params[:to_date]
    if to_date == nil or to_date == ''
    	to_date = from_date
    end
    spot = params[:id]
    conditions = "record_date >= '#{from_date}' and record_date <= '#{to_date}' and end_hour is not null"
    remote_ip = params[:remote_ip]
    remote_ip = request.remote_ip if (remote_ip == nil or remote_ip == '')
    gateway = Gateway.find_by_address(remote_ip)
    spot = gateway.spots.find_by_seq(spot)
    @records = gateway.record_files.find_all_by_spot_id(spot,:conditions=>conditions)
  end
  
  def remove 
  	spot = params[:id]
  	remote_ip = params[:remote_ip]
    remote_ip = request.remote_ip if (remote_ip == nil or remote_ip == '')
    gateway = Gateway.find_by_address(remote_ip)
    spot = gateway.spots.find_by_seq(spot)
    ActiveRecord::Base.connection().insert("insert into record_file_remove_queue select null,path_file,now(),now() from record_files where spot_id = #{spot.id} and gateway_id = #{gateway.id}");
    render :text => "ok" 
  end
  
  def do_remove
  	files = RemoveFile.find(:all,:limit => 5000)
  	files.each do |file|
  		if FileTest::exists?(file.file)
	        File.delete file.file
	    end
	    file.delete
  	end
  	render :text => "ok"
  end

  def play
  	@host = request.host
    @record = RecordFile.find(params[:id])
    @startTime = "#{@record.record_date} #{Utils.date @record.start_hour}:#{Utils.date @record.start_min}"
    @title = "#{params[:spot_name]} #{@record.record_date} #{Utils.date @record.start_hour}:#{Utils.date @record.start_min}-#{Utils.date @record.end_hour}:#{Utils.date @record.end_min}"
  end
  
  def download
  	file = params[:file]
  	send_file file, :type => 'application/octet-stream', :disposition => 'inline',:filename => params[:filename]
  	return
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
