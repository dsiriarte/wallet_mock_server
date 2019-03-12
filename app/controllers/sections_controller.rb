class SectionsController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
  
    def get_sections
      render json: generate_alternate_response, status: :ok
    end
    def generate_alternate_response
      workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerSections.json")
      return workplaces_json
        end
  end
  