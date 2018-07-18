class AuthsController < ApplicationController

  def login
    if param_is_present?(:grant_type)
      if params[:grant_type] == 'password'
        if !param_is_present?(:username)
          render json: missing_param(:username), status: :bad_request
          return
        elsif !param_is_present?(:password)
          render json: missing_param(:password), status: :bad_request
          return
        else
          process_login
          return
        end
      elsif params[:grant_type] == 'refresh_token'
        if !param_is_present?(:refresh_token)
          render json: missing_param(:refresh_token), status: :bad_request
          return
        else
          process_refresh
          return
        end
      end
    end
    render json: unsupported_grant_type(params[:grant_type]), status: :not_implemented
  end

  def change_password
    render json: account_data(params[:account_id]), status: :ok
  end

  def change_profile
      render json: account_data(params[:account_id]), status: :ok
   end

  private

  def process_login
    username = params[:username]
    password = params[:password]

    if !(valid_username?(username))
        if(username == "internal_server_error")
            render json: internal_server_error, status: :internal_server_error
            return
        else
            render json: wrong_credentials, status: :bad_request
            return
        end
    end

    if password != 'password' && password != 'Password1'
      render json: wrong_credentials, status: :bad_request
      return
    end

    render json: generate_response(username), status: :ok
  end

  def process_refresh
    refresh_token = params[:refresh_token]
    refresh_token.slice!('_refresh_token')
    if valid_username?(refresh_token)
      render json: generate_response(refresh_token), status: :ok
    else
      render json: invalid_refresh, status: :unauthorized
    end
  end

  def unsupported_grant_type(param)
    {
      message: "Unsupported grant type: #{param}",
      code: "unsupported_grant_type",
      status: 501,
      name: "TokenError"
    }
  end

  def missing_param(param)
    {
      message: "Missing required parameter: #{param}",
      code: "invalid_request",
      status: 400,
      name: "TokenError"
    }
  end

  def wrong_credentials
    {
      error: "invalid_grant",
      error_description: "Invalid username or password."
    }
  end

  def internal_server_error
   {
     error: "invalid_grant",
     error_description: "Internal server error."
   }
  end

  def account_data(account_id)
    {
      fullName: "Dummy Test",
      id: "#{account_id}",
      username: "Dummy",
      email: "Dummy@mail.com",
      firstName: "Dummy",
      middleName: nil,
      lastName: "Test",
      status: "active",
      passwordModifiedAt: "2016-10-10T19:34:54.592Z",
      createdAt: "2016-09-15T15:42:49.000Z",
      updatedAt: "2016-10-10T19:34:54.000Z",
      applicationId: 2
    }
  end

  def invalid_refresh
    {
      message: "Invalid Access Token",
      code: "server_error",
      uri: nil,
      status: 401,
      name: "AuthorizationError"
    }
  end

  def generate_response(username)
    today = Time.now
    future = today + 5.days
    date_format = "%a, %b %e, %Y %l:%M %p"
    {
      access_token: "#{username}_token",
      refresh_token: "#{username}_refresh_token",
      expires_in: future.to_i,
      ".issued": today.strftime(date_format),
      ".expires": future.strftime(date_format),
      token_type: "Bearer"
    }
  end
end
