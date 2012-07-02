class TasksController < ActionController::Base
	def index
		year = Time.now.year
		month = "%02d" % Time.now.month 
		day = "%02d" % Time.now.day 
		hour = Time.now.hour
		hh = "%02d" % hour
		min = Time.now.min
		mm = "%02d" % min
		log = ""
		path = "/mnt/records"
		unless File.directory? path
			FileUtils.mkdir path
		end
		path << "/#{year}"
		unless File.directory? path
			FileUtils.mkdir path
		end
		path << "/#{month}"
		unless File.directory? path
			FileUtils.mkdir path
		end
		path << "/#{day}" 
		unless File.directory? path
			FileUtils.mkdir path
		end
		tasks = ScheduleWeekly.find_all_by_week_day_and_enabled(Time.now.wday - 1,1,:conditions => {:start_hour => hour,:start_min => min})
		tasks.each do |task|
			file = "#{path}/w_#{task.spot.seq}_#{task.id}"
			cmd = "jxdvr #{task.spot.seq} #{file} 30 #{task.spot.gateway.address} #{task.spot.gateway.port} #{task.last_time} &"
			log << cmd
			system(cmd)
		end
		tasks = ScheduleDaily.find_all_by_schedule_date_and_enabled(Time.now.strftime("%Y-%m-%d"),1,:conditions => {:start_hour => hour,:start_min => min})
		tasks.each do |task|
			file = "#{path}/d_#{task.spot.seq}_#{task.id}"
			cmd = "jxdvr #{task.spot.seq} #{file} 30 #{task.spot.gateway.address} #{task.spot.gateway.port} #{task.last_time} &"
			log << cmd
			system(cmd)
		end
		render :text => log
	end	
	
	def file
		path = params[:name]
		tmp = path.split('/')
		filename = tmp[tmp.size - 1]
		if params[:act] == "0"
			tmp = filename.split('_')
			s_id = tmp[tmp.size - 2]
			if tmp[0] == "w"
				s = ScheduleWeekly.find(s_id)
			else
				s = ScheduleDaily.find(s_id)
			end
			record = RecordFile.new
			record.gateway_id = s.spot.gateway_id
			record.spot_id = s.spot.id
			record.record_date = Time.now
			record.start_hour = Time.now.hour
			record.start_min = Time.now.min
			record.path_file = path
			record.save
		else 
			record = RecordFile.find_by_path_file(path)
			if record
				record.end_hour = Time.now.hour
				record.end_min = Time.now.min
				record.save
			end
		end
		render :text => tmp[0]
	end
end