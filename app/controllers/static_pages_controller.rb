class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @lessons = Lesson.where(user_id: current_user.id)

  	  @j = 0 
    	@lessons.each do |lesson|
    		i = lesson.category.words.count.to_i
    		@j += i
    	end

      following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
      @activities = Activity.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: current_user.id)
    end
  end
end