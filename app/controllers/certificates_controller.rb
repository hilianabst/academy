class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trainings = Training.all
    @training = Training.all
  end
end
