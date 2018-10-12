class BoardCertificationController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_board_certifications
    render json: generate_workplaces_response, status: :ok
  end

  def generate_board_certifications_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerBoardCertifications.json")
    return workplaces_json
      end
end
