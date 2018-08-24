const joi = require("joi");
joi.authHeader = require("joi-authorization-header")(joi);

module.exports = [
  {
    method: "PUT",
    path: "/users/password",
    config: {
      description: "View desscription",
      notes:
        "Upate user password, auth token, old password and new password required",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          currentPassword: joi.string().required(),
          password: joi.string().required()
        }
      }
    },
    handler: function(request, response) {
      if (request.payload.currentPassword !== request.payload.password) {
        return {
          fullName: "Test P Martinez",
          id: 880,
          username: "test",
          email: "test@condorlabs.io",
          firstName: "test",
          middleName: "P",
          lastName: "Martinez",
          status: "active",
          passwordModifiedAt: "2018-04-18T21:33:53.440Z",
          createdAt: "2018-03-12T14:03:31.000Z",
          updatedAt: "2018-04-18T21:33:53.000Z",
          applicationId: 2
        };
      } else {
        return response
          .response({
            statusCode: 400,
            error: "Current password and new password should be different."
          })
          .code(400);
      }
    }
  },
  {
    method: "PUT",
    path: "/users/accounts",
    config: {
      description: "View desscription",
      notes: "Upate user account data",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          generalSettings: joi
            .object()
            .keys({
              firstName: joi.string().required(),
              middleName: joi.string().allow(''),
              lastName: joi.string().required(),
              email: joi.string().required()
            })
            .required(),
          notificationSettings: joi
            .object()
            .keys({
              activeExpiration: joi.boolean().required(),
              activeVerification: joi.boolean().required()
            })
            .required()
        }
      }
    },
    handler: function(request, response) {
      return {
        fullName: "Test O Martinez",
        id: 56280,
        firstName: "Test ",
        middleName: "O",
        lastName: "Martinez",
        number: "MARTESTTEST5",
        email: "test@test.com",
        active: true,
        accountId: 880,
        evercheckId: 4711288,
        createdAt: "2018-03-12T14:03:33.000Z",
        updatedAt: "2018-04-17T15:23:11.000Z",
        employerId: 100,
        role: "employee"
      };
    }
  }
];
