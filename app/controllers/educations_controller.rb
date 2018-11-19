class EducationsController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_educations
      render json: generate_educations_response, status: :ok
    end
  
    def save_educations
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
      end
  
    def delete_educations
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_educations_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerEducations.json")
      return workplaces_json
        end
  end
  