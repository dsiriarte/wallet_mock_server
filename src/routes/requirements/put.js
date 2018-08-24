const joi = require("joi");

module.exports = [
  {
    method: "PUT",
    path: "/applicants/{applicantId}/requirements/submit",
    config: {
      description: "View desscription",
      notes: "Used to mark a requirement as fully completed",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      return {
        status: "SuccessSubmission",
        message:
          "The submission was received, a notification will be sent when it's completed"
      };
    }
  },
  {
    method: "PUT",
    path: "/applicants/{applicantId}/requirements/{requirementId}/unmonitored",
    config: {
      description: "View desscription",
      notes: "Used to update applicant's unmonitored credentials",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          expirationDate: joi
            .string()
            .regex(/[0-9]{2}[/][0-9]{2}[/][0-9]{4}$/g)
            .allow(""),
          file: joi
            .any()
            .meta({ swaggerType: "file" })
            .description("image file")
            .allow(null)
        }
      }
    },
    handler: function(request, response) {
      return {
        status: "SuccessSubmission",
        message:
          "The submission was received, a notification will be sent when it's completed"
      };
    }
  }
];
