class ApplicationController < ActionController::API

  def valid_usernames
    @valid_usernames ||= [
      'no_cards',
      'not_verified',
      'one_current',
      'one_current_no_expiration',
      'one_expired',
      'one_expiring',
      'one_of_each',
      'one_verification_failed',
      'one_verifying',
      'one_verifying_no_board',
      'validuser',
      'applicant_user',
      'one_unverified',
      'one_tbo',
      'one_archived',
      'one_applicant_verification_failed'
    ]
  end

  def valid_ecard_numbers
    @valid_ecard_numbers ||= [
      '142004612172',
      '123456789012'
    ]
  end

  def current_user
    @current_user ||= request.headers['Authorization']
  end

  def authenticate!
    if current_user.nil?
      render json: missing_authentication, status: :unauthorized
      return
    end
    validate_username!
  end

  def validate_username!
    render json: expired_token, status: :unauthorized unless valid_username?(current_user)
  end

  def valid_username?(username)
    user = username
    user.slice!('Bearer ')
    user.slice!('_token')
    if valid_usernames.include?(user)
      @current_user = user
      true
    else
      false
    end
  end

  def param_is_present?(param)
    if params.has_key?(param)
      true
    else
      false
    end
  end

  def require_parameter!(param_name)
    unless param_is_present?(param_name)
      render json: missing_param(param_name), status: :bad_request
      return false
    end
    true
  end

  def require_params!(*param_names)
    param_names.each do |param_name|
      return unless require_parameter!(param_name)
    end
  end

  private

  def missing_authentication
    {
      statusCode: 401,
      error: "Unauthorized",
      message: "Missing authentication"
    }
  end

  def expired_token
    {
      statusCode: 401,
      error: "Unauthorized",
      message: "Expired token received for JSON Web Token validation",
      attributes: {
        error: "Expired token received for JSON Web Token validation"
      }
    }
  end

  def missing_param(param_name)
    {
      statusCode: 400,
      error: "Bad Request",
      message: "child \"#{param_name}\" fails because [\"#{param_name}\" is required]",
      validation: {
        source: "payload",
        keys: [
          "#{param_name}"
        ]
      }
    }
  end
end
