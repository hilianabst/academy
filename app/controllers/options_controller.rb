class OptionsController < ApplicationController
    before_action :set_option, only: [:show, :edit, :update, :destroy]
    before_action :set_question, only: [:create, :new, :edit, :update]
    
    def new
      @option= Option.new
    end
  
    def edit
  
    end
  
    def index
  
    end
  
    def create 
         @option = Option.new(option_params)
         @option.question = @question
        # @question.quiz = Quiz.find(params[:quiz_id])
         if @option.save
         redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La opcion se guardo correctamente"
        end
  
    end
  
    def update 
       # @question.quiz = Quiz.find(params[:quiz_id])
        if @option.update(option_params)
        redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La opcion se guardo correctamente"
       end
 
   end

   def destroy
    # @question.quiz = Quiz.find(params[:quiz_id])
    @question = @option.question
      @option.destroy
     redirect_to training_quiz_path(@question.quiz.training, @question.quiz), notice:"La opcion se guardo correctamente"
    

end
 
  
    private
  
      def option_params
        params.require(:option).permit(:text, :is_correct)
      end
  
      def set_question
        @question = Question.find(params[:question_id])
      
      end
  
      def set_option
        @option  = Option.find(params[:id])

      end
end
