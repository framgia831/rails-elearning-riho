class Word < ApplicationRecord
  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers 
  belongs_to :category
  validates :content, presence: true, length: { maximum: 20}

  # validate :must_chose_one_answer

  def must_chose_one_answer
    unless word_answers.collect { |i| i.correct? || nil  }.compact.any?
    errors.add(:base, 'You must select one correct answer')
    end
  end
  # errors.add(:base, 'You must select one correct answer') unless self.word_answers.find_by(correct: true)
  # end　find_byはnilでは使えない
  def correct_answer
    word_answers.each do |word_answer| 
      if word_answer.correct?
        return word_answer.content
      end
    end 
  end

end