const joi = require("joi");
const authController = require("../../controllers/authController");

module.exports = {
  method: "POST",
  path: "/auth",
  config: {
    auth: false,
    description: "View desscription",
    notes:
      "authenticate users and log in in the app, username and password required, return access token",
    tags: ["api"], // ADD THIS TAG,
    validate: {
      payload: {
        username: joi.string().required(),
        password: joi.string().required(),
        grant_type: joi.string()
      }
    }
  },
  handler: function(request, response) {
    return authController
      .validateUser(request.payload.username, request.payload.password)
      .then(credentials => {
        return response.response(credentials);
      })
      .catch(err => {
        if(err.statusCode === 400) {
        return response
          .response(err)
          .code(400);
        } else {
          return response
          .response(err)
          .code(500);
        }
      });
  }
};
