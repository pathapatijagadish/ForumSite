module ForumsHelper

	def latest_topic(forum)
		str = ""
		if forum.topics.present?
			topic = forum.topics.last
			str += link_to topic.name , forum_topic_path(forum,topic)
			str += "<br/> Last Created : #{topic.created_at.strftime('%d-%b,%Y %H:%M')}"
			user = topic.user
			if user.present?
				str += " By #{user.name}"				
			end
		end
		str.html_safe
	end

end
