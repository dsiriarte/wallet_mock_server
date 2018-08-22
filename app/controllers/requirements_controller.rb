class RequirementsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_requirements
    id = params[:applicantId]
    render json: generate_requirements_response(id), status: :ok
  end

  def get_group_of_requirements
    id = params[:applicantId]
    render json: group_of_requirements(id), status: :ok
  end

  def generate_requirements_response(id)
      if id == "2"
      return File.read("#{Rails.root}/app/mocks/requirements/requirements.json")
    end
    if id == "8"
      return File.read("#{Rails.root}/app/mocks/requirements/requirements_completed_2.json")
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

  def group_of_requirements(id)
    if id == "3"
      return File.read("#{Rails.root}/app/mocks/requirements/requirements_group.json")
    end
    if id == "4"
      return File.read("#{Rails.root}/app/mocks/requirements/requirement_hc.json")
    end
    if id == "5"
      return File.read("#{Rails.root}/app/mocks/requirements/requirement_lic.json")
    end
    if id == "6"
      return File.read("#{Rails.root}/app/mocks/requirements/requirement_cert.json")
    end
    if id == "7"
      return File.read("#{Rails.root}/app/mocks/requirements/requirement_uc.json")
    end
    if id == "8"
      return File.read("#{Rails.root}/app/mocks/requirements/requirements_completed_2.json")
    end
  end

end
