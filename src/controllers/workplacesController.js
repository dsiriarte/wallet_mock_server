'user-strict';

const workplacesRepository = require("../repository/workplacesRepository");

module.exports = {
    getWorkplaces: () => {
        return workplacesRepository.getWorkplaces();
    }
}