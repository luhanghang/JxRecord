xml.instruct!
xml.ActionsWeekly do
	if ActionWeekly.count(:conditions=>{:action_type=>0}) > 0
	xml.Action :type => 'add' do
		@gateways.each do |g|
			if g.action_weeklies.count(:conditions=>{:action_type=>0}) > 0
				xml.Gateway :id => g.id, :address => g.address, :port => g.port do
				g.spots.each do |spot|
					if spot.action_weeklies.count(:conditions=>{:action_type=>0}) > 0
						xml.Spot :id => spot.seq do
							spot.schedule_weeklies.each do |s|
								s.action_weeklies.find_all_by_action_type(0).each do |a|
									xml.Schedule :id => s.id do
										xml.startHour Utils.date s.start_hour
                						xml.startMin Utils.date s.start_min
                						xml.lastTime s.last_time
                						xml.enabled s.enabled
                						xml.weekday s.week_day
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
	
	if ActionWeekly.count(:conditions=>{:action_type=>1}) > 0
	xml.Action :type => 'update' do
		@gateways.each do |g|
			if g.action_weeklies.count(:conditions=>{:action_type=>1}) > 0
				xml.Gateway :id => g.id, :address => g.address, :port => g.port do
				g.spots.each do |spot|
					if spot.action_weeklies.count(:conditions=>{:action_type=>1}) > 0
						xml.Spot :id => spot.seq do
							spot.schedule_weeklies.each do |s|
								s.action_weeklies.find_all_by_action_type(1).each do |a|
									xml.Schedule :id => s.id do
										xml.startHour Utils.date s.start_hour
                						xml.startMin Utils.date s.start_min
                						xml.lastTime s.last_time
              							xml.enabled s.enabled
                						xml.weekday s.week_day
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
	
	deletes = ActionWeekly.find_all_by_action_type(2)
	if deletes.size > 0
	xml.Action :type => 'delete' do
		deletes.each do |a|
			xml.Schedule :id => a.schedule_weekly_id
		end 		
	end
	end
end