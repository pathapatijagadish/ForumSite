module ApplicationHelper
    def bootstrap_class_for flash_type
	    case flash_type
	      when :success
	        "alert-success"
	      when :error
	        "alert-error"
	      when :alert
	        "alert-block"
	      when :notice
	        "alert-info"
	      else
	        flash_type.to_s
	    end
  	end

  	def allowed_to?(user,obj)   
  		return false unless user  		   		
  		if obj.is_a?(Forum)
  			allowed = user.is_admin?
  		elsif obj.is_a?(Topic)
  			allowed = user.is_admin? || check_object?(user,obj)
  		elsif obj.is_a?(Comment)
  			allowed = user.is_admin? || check_object?(user,obj)
  		else
  			allowed = false		
  		end  		
  		allowed
  	end

  	def check_object?(user,obj)
  		if obj.new_record?
  			true
  		else
  			obj.user_id==user.id
  		end
  	end
end
