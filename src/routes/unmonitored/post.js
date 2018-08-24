const joi = require("joi");
const unmonitoredController = require("../../controllers/unmonitoredController");

module.exports = {
    method: "POST",
    path: "/unmonitored/{id}",
    config: {
      description: "View desscription",
      notes:
        "Upate unmonitored credential with renewal date and credential photo, id and renewal date and photo required",
      tags: ["api"], // ADD THIS TAG
      validate: {
        payload: {
          renewalDate: joi
            .string()
            .regex(/[0-9]{2}[/][0-9]{4}$/g)
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
          imageUrl:
            "http://test.storages3.evercheck.com:3000/evercheck/62895c72-0c49-43ec-ab8b-0cd63acb7966",
          id: 18,
          completed: true,
          certificantName: "Test 8",
          certificateType: null,
          issueDate: null,
          verificationDate: null,
          approved: null,
          comment: null,
          reviewedBy: null,
          reviewedAt: null,
          createdAt: "2018-05-31T19:41:13.000Z",
          updatedAt: "2018-05-31T22:25:45.000Z",
          unmonitoredLicenseId: 3
        };
      }
  }