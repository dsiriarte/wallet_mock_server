"user-strict";

const requirementRepository = require("../repository/requirementsRepository");

module.exports = {
  getRequirements: applicantId => {
    return requirementRepository.getRequirements(applicantId);
  },
  getGroupOfRequirements: requirementId => {
    return requirementRepository.getGroupOfRequirements(requirementId);
  }
};
