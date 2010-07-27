class DemoController < ApplicationController
  def index
    @display_name = crowd_current_user_display_name    
  end

  def log_out
    crowd_log_out
  end
end
