class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show, :likes]
  before_action :set_current_training, only: [:likes]

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all
    @training = Training.new
    
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  # def create
  #   @training = Training.new(training_params)

  #   respond_to do |format|
  #     if @training.save
  #       format.html { redirect_to @training, notice: 'Training was successfully created.' }
  #       format.json { render :show, status: :created, location: @training }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @training.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @training = Training.new(training_params)
    respond_to do |format|
          if @training.save
            quiz = Quiz.create(name:"Prueba",training:@training)
            format.html { redirect_to @training, notice: 'Training was successfully created.' }
            format.json { render :show, status: :created, location: @training }
            format.js
          else
            format.html { render :new }
            format.json { render json: @training.errors, status: :unprocessable_entity }
            format.js
          end
        end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes
    if @training.is_liked?(current_user)
      @training.remove_like(current_user)
    else
      @training.add_like(current_user)
    end
    redirect_to trainings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def set_current_training
      @training = Training.find(params[:training_id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:name, :description, :url_video, :image)
    end
end
