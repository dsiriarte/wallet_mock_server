
class HospitalAffiliationsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_hospital_affiliations
    render json: generate_hospital_affiliations_response, status: :ok
  end

  def save_hospital_affiliation
  	render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
    end

  def delete_hospital_affiliation
  	render json: {
      status: "DeleteSuccess",
      message: "was deletec"
    }, status: :ok
  end

  def generate_hospital_affiliations_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerHospitalAffiliations.json")
    return workplaces_json
  end

end
