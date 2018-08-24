"use- strict";

module.exports = {
  getRequirements: applicantId => {
    console.log(applicantId);
    if (applicantId === "2") {
      return require("../data/requirements/requirements.json");
    } else if (applicantId === "8") {
      return require("../data/requirements/requirements_completed_2.json");
    } else {
      return require("../data/requirements/requirements_completed.json");
    }
  },

  getGroupOfRequirements: requirementId => {
    if (requirementId === "3") {
      return require(`../data/requirements/requirements_group.json`);
    } else if (requirementId === "4") {
      return require(`../data/requirements/requirement_hc.json`);
    } else if (requirementId === "5") {
      return require(`../data/requirements/requirement_lic.json`);
    } else if (requirementId === "6") {
      return require(`../data/requirements/requirement_cert.json`);
    } else if (requirementId === "7") {
      return require(`../data/requirements/requirement_uc.json`);
    } else if (requirementId === "8") {
      return require(`../data/requirements/requirements_completed_2.json`);
    }
  }
};
