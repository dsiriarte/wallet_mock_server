class DevicesController < ApplicationController
  before_action :authenticate!, only: [:register_fcm_token]
  before_action do
    require_parameter!(:device)
  end

  def register_fcm_token
    render json: generate_response, status: :ok
  end

  def un_register_fcm_token
    render json: generate_empty_response, status: :ok
  end

  private
  def generate_response
    {
      id: 123,
      device: params[:device],
      userId: 123
    }
  end
  def generate_empty_response
    {}
  end
end
