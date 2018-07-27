class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, through: :lesson_words
  has_many :activities, as: :action#ここであってる？LessooWrdsに記述？
  after_update :create_relationship_activity

  def correct_answers
  	word_answers.where(correct: true)
  end

  def learned_words_num(user)
  	@lessons = user.lessons

  	j = 0 
  	@lessons.each do |lesson|
  		i = lesson.category.words.count.to_i
  		j += i
  	end
  end
end

private
def create_relationship_activity 
  activities.create(user_id: user.id)
end