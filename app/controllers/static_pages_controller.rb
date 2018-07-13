class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @lessons = Lesson.where(user_id: current_user.id)

  	  @j = 0 
    	@lessons.each do |lesson|
    		i = lesson.category.words.count.to_i
    		# @i += j
    		# j = @i
    		@j += i
    	end
    end
  end
end
