class EmploymentController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_employment
    render json: generate_employment_response, status: :ok
  end

  def generate_employment_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerEmployment.json")
    return workplaces_json
  end

  def save_employment
    render json: {
    status: "SuccessSubmission",
    message: "The submission was received, a notification will be sent when it's completed"
  }, status: :ok
  end

end
