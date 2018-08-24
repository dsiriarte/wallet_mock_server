const userController = require("../../controllers/userController");

module.exports = {
  method: "GET",
  path: "/users/me",
  config: {
    description: "View desscription",
    notes: "Upate user account data",
    tags: ["api"] // ADD THIS TAG
  },
  handler: function(request, response) {
        return userController.getUserData({
          username: request.auth.credentials.payload.username,
          password: request.auth.credentials.payload.password
        });
  }
};
