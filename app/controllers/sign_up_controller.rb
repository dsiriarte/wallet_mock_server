class SignUpController < ApplicationController
  def get_account_details
    access_code = params[:code]
    if "nCcTZa".eql? access_code
      render json: generate_account_response(access_code), status: :ok
    else
      render json: code_not_found_response, status: :not_found
    end
  end

  def get_employer_details
    render json: generate_employer_response, status: :ok
  end

  def create_account
    access_code = params[:code]
    if "nCcTZa".eql? access_code
      username = params[:username]
      if "validuser".eql? username
        render json: generate_account_creation_response, status: :ok
      else
        render json: username_already_exists_response(username), status: :bad_request
      end
    else
      render json: code_not_found_response, status: :not_found
    end
  end

  def resend_code
    email = params[:email]
    if "test@testmail.io".eql? email
      render json: email_confirmation_response, status: :ok
    else
      render json: email_not_found_response, status: :not_found
    end
  end

  def reset_password
    email = params[:email]
    if "test@testmail.io".eql? email
      render json: email_confirmation_response, status: :ok
    else
      render json: email_not_found_response, status: :not_found
    end
  end

  private
  def generate_account_response(code)
    {
      code: "#{code}",
      status: "created",
      createdAt: "2016-10-04T15:14:03.000Z",
      updatedAt: "2016-10-04T15:14:03.000Z",
      account: {
        fullName: "JORGE RAMIREZ",
        id: 22,
        username: nil,
        email: "JRAMIREZSERRATO@GMAIL.COM",
        firstName: "JORGE",
        middleName: nil,
        lastName: "RAMIREZ",
        status: "unverified",
        passwordModifiedAt: nil,
        createdAt: "2016-10-04T15:14:02.000Z",
        updatedAt: "2016-10-04T15:14:02.000Z",
        applicationId: 2
      }
    }
  end

  def generate_account_creation_response
      {
        fullName: "MARLEN SCHWANKE",
        id: 101,
        username: "marlen",
        email: "100076@MAIL.COM",
        firstName: "MARLEN",
        middleName: nil,
        lastName: "SCHWANKE",
        status: "active",
        passwordModifiedAt: nil,
        createdAt: "2016-09-12T19:34:26.000Z",
        updatedAt: "2016-09-12T20:49:28.000Z",
        applicationId: 2
    }
  end

  def generate_employer_response
    [
      {
        fullName: "Mary Smith",
        id: 21,
        firstName: "Mary",
        middleName: nil,
        lastName: "Smith",
        number: "12356",
        email: "mary12345@mail.com",
        active: true,
        accountId: 23,
        createdAt: "2016-09-22T15:49:31.000Z",
        updatedAt: "2016-09-22T15:49:31.000Z",
        employerId: 147,
        employer: {
          id: 147,
          name: "HEARTCARD TEST EMPLOYER",
          active: true,
          logoUrl: "http://i.imgur.com/U8atCPi.png",
          createdAt: "2016-09-15T15:48:10.000Z",
          updatedAt: "2016-09-15T15:48:10.000Z"
        }
      }
    ]
  end

  def email_confirmation_response
    {
      fullName: "BOBAN ABRAHAM",
      id: 28,
      username: nil,
      email: "JTANGARIFE@ISF.COM.CO",
      firstName: "BOBAN",
      middleName: nil,
      lastName: "ABRAHAM",
      status: "unverified",
      passwordModifiedAt: nil,
      createdAt: "2016-10-21T14:33:23.000Z",
      updatedAt: "2016-10-21T14:33:23.000Z",
      applicationId: 2,
      token: {
        code: "etde39",
        status: "created",
        createdAt: "2016-10-21T14:33:24.000Z",
        updatedAt: "2016-10-21T14:33:24.000Z"
      }
    }
  end

  def code_not_found_response
    {
      statusCode: 404,
      error: "Not Found",
      message: "Access code does not exists"
    }
  end

  def username_already_exists_response(username)
    {
      statusCode: 400,
      error: "Bad Request",
      message: "Username '#{username}' is already in use"
    }
  end

  def email_not_found_response
    {
      statusCode: 404,
      error: "Not Found",
      message: "EMAIL_DOES_NOT_EXIST"
    }
  end
end
