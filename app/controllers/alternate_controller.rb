class AlternateController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_alternate
      render json: generate_alternate_response, status: :ok
    end
  
    def save_alternate
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
      end
  
    def delete_alternate
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_alternate_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerAlternate.json")
      return workplaces_json
        end
  end
  