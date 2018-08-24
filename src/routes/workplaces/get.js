const workplaceController = require("../../controllers/workplacesController");

module.exports = {
    method: "GET",
    path: "/users/workplaces",
    config: {
      description: "View desscription",
      notes:
        "Used to get the workplaces of an user",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      try {
        return workplaceController.getWorkplaces();
      } catch (err) {
        console.log(err);
      }
    }
  };