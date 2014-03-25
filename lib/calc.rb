module Calc
  def calc_metric_count_per_hour(target_users, metric, reset = false)
    target_users.each do |user|
      if reset
        frames = user.wb_user_frames.order("created_at asc")
        frames.each do |frame|
          frame["#{metric}_per_hour"] = nil
        end
      else
        start_frame = user.wb_user_frames.order("created_at desc").where("#{metric}_per_hour is not null").first
        frames = user.wb_user_frames.order("created_at asc").where("created_at > ?", start_frame ? start_frame.created_at : Time.at(0)).all
        frames.unshift(start_frame) if start_frame
      end

      WbUserFrame.transaction do
        frames[1..-1].each_with_index do |frame, i|
          next if frame["#{metric}_per_hour"]
          calc_metric_count_one_frame(frame, metric, frames[i]) # not i-1
          frame.save!
        end
      end unless frames.empty?
    end
  end

  def calc_metric_count_one_frame(frame, metric, prev_frame)
    if !prev_frame
      # can't do much here
    else
      # derivative
      frame["#{metric}_per_hour"] = ((frame["#{metric}_count"] - prev_frame["#{metric}_count"])*1.hour/(frame.created_at.to_f - prev_frame.created_at.to_f)).round(30) # prevent underflow
    end
  end

end