'user-strict';

const userRepository = require("../repository/userRepository");

module.exports = {
    getUserData: (user) => {
        return userRepository.getUserData(user);
    }
}