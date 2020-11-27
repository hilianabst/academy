class QuizzesController < InheritedResources::Base
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :set_training, only: [:create, :new, :edit]
  
  def new
    @quiz= Quiz.new
  end

  def edit

  end

  def index

  end

  def create 
      # @question = Question.new(question_params)
      # @question.quiz = Quiz.find(params[:quiz_id])
      # if @question.save
      # redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La pregunta se guardo correctamente"
      # end

  end


  private

    def quiz_params
      params.require(:quiz).permit(:training_id)
    end

    def set_training
      @training = Training.find(params[:training_id])
    
    end

    def set_quiz
      @quiz = Quiz.find(params[:id])
    
    end

end
