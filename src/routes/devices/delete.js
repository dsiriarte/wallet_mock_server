const joi = require("joi");

module.exports = {
  method: "DELETE",
  path: "/devices",
  config: {
    description: "View desscription",
    notes: "Used to register a device associated to a user account",
    tags: ["api"], // ADD THIS TAG
    validate: {
      payload: {
        device: joi.string().required()
      }
    }
  },
  handler: function(request, response) {
    return {
      device:
        "fzdWmu7rZOM:APA31bHH6n9uMEBsqBoyWneYtgato7SHxO9XDwLyujbWeCHwQHAkEFr"
    };
  }
};
