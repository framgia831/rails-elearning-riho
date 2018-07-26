class LessonsController < ApplicationController

  def create
    category = Category.find(params[:category_id])
    lesson = category.lessons.create(user: current_user)

    category.words.each do |word|
      lesson.lesson_words.create!(word: word)
    end

    redirect_to [lesson, lesson.lesson_words.first]
  end

  def show
    # @category = Category.find(params[:category_id])#ここでは取れない　取るならcategory = @lesson.category
    @lesson = Lesson.find(params[:id])
    @category = @lesson.category
    @lesson_words = @lesson.lesson_words
  end

end