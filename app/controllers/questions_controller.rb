class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @pagy, @questions = pagy(Question.all)
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :desc
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_url(@question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_url(@question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
