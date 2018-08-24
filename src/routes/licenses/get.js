const licenseController = require("../../controllers/licenseController");

module.exports = {
    method: "GET",
    path: "/licenses",
    config: {
      description: "View desscription",
      notes:
        "Returns a list of licenses, Important: the back object inside documentation is not obligatory" +
        "Important: if the fileType does not exists, it is valid to assume that it is an image, since PDF's" +
        " are only allowed for unmonitored credentials submissions and these are always going to have the fileType",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      try {
        return licenseController.getLicenses({
          username: request.auth.credentials.payload.username,
          password: request.auth.credentials.payload.password
        });
      } catch (err) {
        console.log(err);
      }
    }
  };