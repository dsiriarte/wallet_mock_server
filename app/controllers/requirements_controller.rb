class RequirementsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_requirements
    render json: generate_requirements_response, status: :ok
  end

  def generate_requirements_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/requirements/requirements.json")
    return workplaces_json
  end

  def upload_picture
    render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
  end

  def add_licenses_or_certification
    render json: {
	  	status: "SuccessSubmission",
		  message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
  end

  def tbo
    render json: {
      status: "SuccessSubmission",
      message: "Requirement marked as tbo successfully"
    }, status: :ok
  end

end
