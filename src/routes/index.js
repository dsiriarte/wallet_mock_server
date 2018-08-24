var _ = require("lodash");

var routes = [];
require("./cards/cardsRoutes").forEach(function(route) {
  routes.push(route);
});
require("./unmonitored/unmonitoredRoutes").forEach(function(route) {
  routes.push(route);
});
require("./auth/authRoutes").forEach(function(route) {
  routes.push(route);
});
require("./users/usersRoutes").forEach(function(route) {
  routes.push(route);
});
require("./requirements/requirementRoutes").forEach(function(route) {
  routes.push(route);
});
require("./licenses/licenseRoutes").forEach(function(route) {
  routes.push(route);
});
require("./workplaces/workplacesRoutes").forEach(function(route) {
  routes.push(route);
});
require("./devices/deviceRoutes").forEach(function(route) {
  routes.push(route);
});

module.exports = _.flatten(routes);