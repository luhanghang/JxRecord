xml.instruct!
xml.ActionsDaily do
	if ActionDaily.count(:conditions=>{:action_type=>0}) > 0
	xml.Action :type => 'add' do
		@gateways.each do |g|
			if g.action_dailies.count(:conditions=>{:action_type=>0}) > 0
				xml.Gateway :id => g.id, :address => g.address, :port => g.port do
				g.spots.each do |spot|
					if spot.action_dailies.count(:conditions=>{:action_type=>0}) > 0
						xml.Spot :id => spot.seq do
							spot.schedule_dailies.each do |s|
								s.action_dailies.find_all_by_action_type(0).each do |a|
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
			end
		end	
	end
	end
	
	if ActionDaily.count(:conditions=>{:action_type=>1}) > 0
	xml.Action :type => 'update' do
		@gateways.each do |g|
			if g.action_dailies.count(:conditions=>{:action_type=>1}) > 0
				xml.Gateway :id => g.id, :address => g.address, :port => g.port do
				g.spots.each do |spot|
					if spot.action_dailies.count(:conditions=>{:action_type=>1}) > 0
						xml.Spot :id => spot.seq do
							spot.schedule_dailies.each do |s|
								s.action_dailies.find_all_by_action_type(1).each do |a|
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
			end
		end
	end
	end
	
	deletes = ActionDaily.find_all_by_action_type(2)
	if deletes.size > 0
	xml.Action :type => 'delete' do
		deletes.each do |a|
			xml.Schedule :id => a.schedule_daily_id
		end 		
	end
	end
end