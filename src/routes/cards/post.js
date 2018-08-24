const joi = require("joi");

module.exports = [
  {
    method: "POST",
    path: "/heartcards/{id}/verifications/ecard",
    config: {
      description: "View desscription",
      notes:
        "Upate heartcard with ecard number, hearcart id and ecard required",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          number: joi.number().required()
        }
      }
    },
    handler: function(request, response) {
      try {
        return {
          status: "SuccessSubmission",
          message:
            "The submission was received, a notification will be sent when it's completed"
        };
      } catch (err) {
        console.log(err);
      }
    }
  },
  {
    method: "POST",
    path: "/heartcards/{id}/verifications/ocr",
    config: {
      description: "View desscription",
      notes:
        "Upate heartcard with renewal date, heartcard front and back photo, hearcart id and ecard required",
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
        status: "SuccessSubmission",
        message:
          "The submission was received, a notification will be sent when it's completed"
      };
    }
  }
];
