class CreateLessonWords < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_words do |t|
      t.references :lesson
      t.references :word
      t.references :word_answer

      t.timestamps
    end
  end
end
