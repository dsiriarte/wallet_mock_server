class SponsoringController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_sponsoring
      render json: generate_sponsoring_response, status: :ok
    end
  
    def save_sponsoring
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
      end
  
    def delete_sponsoring
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_sponsoring_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerSponsoring.json")
      return workplaces_json
    end
  
  end