xml.instruct!
xml.Schedules do
if @schedules
  @schedules.each do |s|
    xml.Schedule :id => s.id do
      xml.startHour Utils.date s.start_hour
      xml.startMin Utils.date s.start_min
      xml.endHour Utils.date s.end_hour
      xml.endMin Utils.date s.end_min
      xml.lastTime s.last_time
      xml.enabled s.enabled
      xml.weekDay s.week_day
      xml.color s.color
    end
  end
 end
end