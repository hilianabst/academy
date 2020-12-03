class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trainings = Training.all
    @training = Training.all
    respond_to do |format|
      format.html
      format.pdf {render template:'certificates/pdf', pdf:'pdf'}
    end
  end

end
