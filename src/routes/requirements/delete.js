module.exports = {
    method: "DELETE",
    path: "/applicants/{applicantId}/requirements/{requirementId}",
    config: {
      description: "View desscription",
      notes: "Used to do an applicant's ecard submission",
      tags: ["api"] // ADD THIS TAG
    },
    handler: function(request, response) {
      return {
        status: "SuccessSubmission",
        message:
          "The submission was received, a notification will be sent when it's completed"
      };
    }
  };