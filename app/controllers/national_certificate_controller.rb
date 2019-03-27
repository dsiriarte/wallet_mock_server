class NationalCertificateController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_nationalCertificates
      render json: generate_nationalCertificate_response, status: :ok
    end
  
    def save_nationalCertificate
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
    end
  
    def delete_nationalCertificate
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_nationalCertificate_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerNationalCertificate.json")
      return workplaces_json
        end
  end
  