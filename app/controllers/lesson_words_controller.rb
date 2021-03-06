class LessonWordsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_word = LessonWord.find(params[:id])
  end

  def update
    lesson = Lesson.find(params[:lesson_id])
    lesson_word = LessonWord.find(params[:id])
    answer = WordAnswer.find(params[:word_answer_id])

    if lesson_word.update(word_answer: answer)
      i = lesson.lesson_words.index(lesson_word)#ここのindexはどういう意味？配列番号？

      unless lesson_word === lesson.lesson_words.last
        redirect_to [lesson, lesson.lesson_words[ i+1 ] ]
      else
        lesson.update(result: lesson.correct_answers.count)
        redirect_to lesson#showにいくのはindexないから？
      end
    end
  end
  
end