"use- strict";

module.exports = {
  getLicenses: (user) => {
    return require(`../data/cards/${user.username}.json`);
  }
};
