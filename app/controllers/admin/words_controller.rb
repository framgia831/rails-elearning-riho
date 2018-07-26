class Admin::WordsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    4.times{@word.word_answers.build}
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "Successfully saved word and answers"
      redirect_to admin_category_words_path(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully changed the word and answers"
      redirect_to admin_category_words_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    word = Word.find(params[:id])
    word.destroy
    flash.now[:success] = "The word was deleted."
    redirect_to admin_category_words_path(@category, word)
  end


  private
  def word_params
    params.require(:word).permit(:content, word_answers_attributes: [:id, :content, :correct]) #ここcorrect忘れないで
  end
end







