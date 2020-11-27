class QuestionsController < ApplicationController
    def new
        @question = Question.new
        @training = Training.find(params[:training_id])
    end

    def edit
        @training = Training.find(params[:training_id])
        @question = Question.find(params[:id])
    end
    
    def index

    end

    def create 
        @question = Question.new(question_params)
        @question.quiz = Quiz.find(params[:quiz_id])
        if @question.save
        redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La pregunta se guardo correctamente"
        end

    end

    def update
        @question = Question.find(params[:id])
        @question.update(question_params)
        if @question.save
        redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La pregunta se actualizo correctamente"
        end

    end

    private

    def question_params
        params.require(:question).permit(:title)
    end
end
