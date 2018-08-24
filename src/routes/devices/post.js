const joi = require("joi");

module.exports = {
    method: "POST",
    path: "/devices",
    config: {
      description: "View desscription",
      notes:
        "Used to register a device associated to a user account",
      tags: ["api"], // ADD THIS TAG
      validate: {
          payload: {
              platform: joi.string().required(),
              device: joi.string().required()
          }
      }
    },
    handler: function(request, response) {
      return {
          "platform": "android",
          "device": "fzdWmu7rZOM:APA31bHH6n9uMEBsqBoyWneYtgato7SHxO9XDwLyujbWeCHwQHAkEFr"
        };
    }
  };