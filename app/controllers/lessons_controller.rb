class LessonsController < ApplicationController

  def create
    category = Category.find(params[:category_id])
    lesson = category.lessons.create(user: current_user)

    category.words.each do |word|
      lesson.lesson_words.create!(word: word)
    end

    redirect_to [lesson, lesson.lesson_words.first]
  end

  def update
    @lesson = Lesson.find(params[:id])

    # @lesson.lesson_words.each do |lesson_word|
    #   lesson_word.update(word_answer_id: nil)
    # end

    lesson_word= @lesson.lesson_words.find_by(word_answer_id: nil)
    redirect_to [@lesson, lesson_word]
  end

  def show
    # @category = Category.find(params[:category_id])#ここでは取れない　取るならcategory = @lesson.category
    @lesson = Lesson.find(params[:id])
    @category = @lesson.category
    @lesson_words = @lesson.lesson_words
  end

end