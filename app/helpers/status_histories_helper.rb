module StatusHistoriesHelper
  extend ActionView::Helpers::DateHelper

  def self.sec2dhms(secs)
    mm, ss = secs.divmod(60)
    hh, mm = mm.divmod(60)
  end

  def self.status_time(line)
    if line.to?
      secs = (line.to - line.from).to_i
      time_arr = sec2dhms(secs)
      "#{time_arr[0]}h #{time_arr[1]}min"
    else
      distance_of_time_in_words(line.from, Time.new)
    end
  end
end
