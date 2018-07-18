class NotificationsController < ApplicationController
  before_action :authenticate!
  before_action only: [:set_preferences] do
    require_params!(:activeExpiration, :activeVerification)
  end

  def obtain_preferences
    render json: generate_response, status: :ok
  end

  def set_preferences
    save_preferences(params[:activeExpiration], params[:activeVerification])
    render json: generate_response, status: :ok
  end

  private
  def generate_response
    settings = Setting.all
    response = {}
    settings.each do |row|
      row_name = row.name
      row_value = row.value
      response.merge!("#{row_name}" => row_value)
    end
    response
  end

  def save_preferences(active_expiration, active_verification)
    Setting.where(name: 'activeExpiration').update_all(value: active_expiration)
    Setting.where(name: 'activeVerification').update_all(value: active_verification)
  end
end
