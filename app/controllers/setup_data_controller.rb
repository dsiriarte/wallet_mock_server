class PracticeLocationsController < ApplicationController
  def setupData
    workplaces_json = File.read("#{Rails.root}/app/mocks/setupData.json")
    return workplaces_json
      end
end
