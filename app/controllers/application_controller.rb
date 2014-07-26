class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def autherize?(obj)    
  	unless allowed_to?(current_user,obj)
        flash[:alert] = 'You are not autherized to access this page..!!'
        redirect_to root_url and return
    end
  end
end
