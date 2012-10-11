xml.instruct!
xml.Records do
    if @records
        @records.each do |s|
        	size = 0
            if FileTest::exists?(s.path_file)
            	file = File.new(s.path_file)
            	size = file.stat.size
            end
            if size > 0     
	            xml.Record :id => s.id do
	                xml.startHour Utils.date s.start_hour
	                xml.startMin Utils.date s.start_min
	                xml.endHour Utils.date s.end_hour
	                xml.endMin Utils.date s.end_min
	                xml.date s.record_date
	                xml.state s.state
	                xml.error s.error
	                xml.pathFile s.path_file
	                xml.fileSize size
	            end
	        else
	        	if FileTest::exists?(s.path_file)
	        		File.delete s.path_file
	        	end
	        	s.delete        
            end
        end
    end
end