class ProviderController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_provider_licenses
    render json: generate_provider_licenses_response, status: :ok
  end

  def save_provider_licenses
  	render json: {
      status: "SuccessSubmission",
      message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
    end

  def generate_provider_licenses_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerLicenses.json")
    return workplaces_json
      end
end