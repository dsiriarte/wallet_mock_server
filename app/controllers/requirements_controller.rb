class RequirementsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_requirements
    id = params[:applicantId]
    render json: generate_requirements_response(id), status: :ok
  end

  def generate_requirements_response(id)
      if id == "2"
      return File.read("#{Rails.root}/app/mocks/requirements/requirements.json")
    else
      return workplaces_json = File.read("#{Rails.root}/app/mocks/requirements/requirements_completed.json")
  end
end

  def upload_picture
    render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
  end

  def upload_pictures
    render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
  end

  def upload_ecard
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

  def submit
    render json: {
      status: "SuccessSubmission",
      message: "Requirements submitted successfully"
    }, status: :ok
  end

end
