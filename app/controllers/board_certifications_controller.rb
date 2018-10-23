class BoardCertificationsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_board_certifications
    render json: generate_board_certifications_response, status: :ok
  end

  def save_provider_licenses
  	render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
    end

  def delete_board_certification
  	render json: {
      status: "DeleteSuccess",
      message: "was deletec"
    }, status: :ok
  end

  def generate_board_certifications_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerBoardCertifications.json")
    return workplaces_json
  end

end
