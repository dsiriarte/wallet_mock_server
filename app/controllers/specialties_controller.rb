class SpecialtiesController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_specialties
    render json: generate_specialties_response, status: :ok
  end

  def generate_specialties_response
    specialties_json = File.read("#{Rails.root}/app/mocks/specialties/specialties.json")
    return specialties_json
      end
end