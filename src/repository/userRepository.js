"use- strict";

module.exports = {
  getUserData: (user) => {
    return require(`../data/employees/${user.username}.json`);
  }
};
