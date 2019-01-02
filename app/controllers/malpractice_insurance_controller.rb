
class MalpracticeInsuranceController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_insurance
      render json: generate_insurance_response, status: :ok
    end
  
    def save_insurance
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
      end
  
    def delete_insurance
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_insurance_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerMalpracticeInsurance.json")
      return workplaces_json
    end
  
  end