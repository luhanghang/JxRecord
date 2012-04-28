xml.instruct!
xml.SchedulesDaily do
	@gateways.each do |g|
		xml.Gateway :id=>g.id, :address=>g.address, :port=>g.port do
		g.spots.each do |spot|
			xml.Spot :id=>spot.seq do
        	spot.schedule_dailies.each do |s|
            	xml.Schedule :id => s.id do
                	xml.startHour Utils.date s.start_hour
                	xml.startMin Utils.date s.start_min
                	xml.lastTime s.last_time
                	xml.enabled s.enabled
                	xml.scheduleDate s.schedule_date
            	end
        	end
    		end
		end
    	end
    end
end