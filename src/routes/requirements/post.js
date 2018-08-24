const joi = require("joi");

module.exports = [
  {
    method: "POST",
    path: "/applicants/{applicantId}/requirements/{requirementId}/automated",
    config: {
      description: "View desscription",
      notes:
        "Used to do an applicant's automated requirement submission. This request is sent to a queue which responds asynchronously",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          licenseNumber: joi.string().required(),
          certState: joi.string()
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
  },
  {
    method: "POST",
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
            .required(),
          file: joi
            .any()
            .meta({ swaggerType: "file" })
            .allow("")
            .description("image file")
            .required()
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
  },
  {
    method: "POST",
    path: "/applicants/{applicantId}/requirements/{requirementId}/tbo",
    config: {
      description: "View desscription",
      notes: "Used to mark a requirement as tbo(to be obtained)",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      return {
        statusCode: 200,
        message: "Requirement marked as tbo successfully"
      };
    }
  },
  {
    method: "POST",
    path: "/applicants/{applicantId}/requirements/{requirementId}/ocr",
    config: {
      description: "View desscription",
      notes: "Used to mark a requirement as tbo(to be obtained)",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          renewalDate: joi
            .string()
            .regex(/[0-9]{2}[/][0-9]{4}$/g)
            .required(),
          frontPhoto: joi
            .any()
            .meta({ swaggerType: "file" })
            .allow("")
            .description("image file")
            .required(),
          backPhoto: joi
            .any()
            .meta({ swaggerType: "file" })
            .allow("")
            .description("image file")
            .required()
        }
      }
    },
    handler: function(request, response) {
      return {
        statusCode: 200,
        message: "Requirement marked as tbo successfully"
      };
    }
  },
  {
    method: "POST",
    path: "/applicants/{applicantId}/requirements/{requirementId}/ecard",
    config: {
      description: "View desscription",
      notes: "Used to do an applicant's ecard submission",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          number: joi.number().required()
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
