const requirementController = require("../../controllers/requirementsController");

module.exports = [{
    method: "GET",
    path: "/applicants/{applicantId}/requirements",
    config: {
      description: "View desscription",
      notes:
        "The data field of the response contains an array of groups of requirements, " +
        "where the requirements within a group are related by an OR and the groups are related by an AND to each other.",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      return requirementController.getRequirements(request.params.applicantId);
    }
  },
  {
    method: "GET",
    path: "/applicants/{applicantId}/requirements/{requirementId}/group",
    config: {
      description: "View desscription",
      notes:
        "The data field of the response contains an array of groups of requirements, " +
        "where the requirements within a group are related by an OR and the groups are related by an AND to each other.",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      return requirementController.getGroupOfRequirements(request.params.requirementId);
    }
  }];