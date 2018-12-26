class PeerReferenceController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_peer_reference
      render json: generate_peer_reference_response, status: :ok
    end
  
    def save_peer_reference
        render json: {
        status: "SuccessSubmission",
        message: "The submission was received, a notification will be sent when it's completed"
      }, status: :ok
      end
  
    def delete_peer_reference
        render json: {
        status: "DeleteSuccess",
        message: "was deletec"
      }, status: :ok
    end
  
    def generate_peer_reference_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerPeerReference.json")
      return workplaces_json
        end
  end