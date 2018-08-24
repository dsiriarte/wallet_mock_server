'user-strict';

const licenseRepository = require("../repository/licenseReposiroty");

module.exports = {
    getLicenses: (user) => {
        return licenseRepository.getLicenses(user);
    }
}