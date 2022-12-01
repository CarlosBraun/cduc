class ApplicationController < ActionController::Base
  include Pagy::Backend
  $tempuid = nil
  $masterauth = nil
  $lowauth = nil
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user
  
  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :telephone, :flyer ])
    end
  end

  private

  def check_log
    if !user_signed_in?
      redirect_back(fallback_location: root_path)
    end
  end

  def set_user
    executive = SupportExecutive.first
    supervisor = Supervisor.first
    temp = User.first

    executive.update(name: temp.name, last_name: temp.last_name, email: temp.email, telephone: temp.telephone)
    supervisor.update(name: temp.name, last_name: temp.last_name, email: temp.email, telephone: temp.telephone)
    se = SupportExecutive.all
    temp1 = false
    if user_signed_in?
      se.each do |x|
        if current_user.email == x.email
          temp1 = true
        end
      end
    end
    if current_user
      if current_user.email == supervisor.email
        $masterauth = true
      elsif temp1
        $masterauth = false
        $lowauth = true
      else
        $masterauth = false
        $lowauth = false
      end
      current_user
    else
      current_user = User.new
    end
  end
end
