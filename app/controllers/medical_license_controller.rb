class MedicalLicenseController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_medicalLicenses
      render json: generate_medicalLicenses_response, status: :ok
    end
  
    def save_medicalLicense
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
    end
  
    def delete_medicalLicense
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_medicalLicenses_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerMedicalLicenses.json")
      return workplaces_json
        end
  end