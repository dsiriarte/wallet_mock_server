"user-strict";
const validUsers = [
  { username: "one_of_each", password: "password", id: 1 },
  { username: "one_expiring", password: "password", id: 2 },
  { username: "one_expired", password: "password", id: 3 },
  { username: "one_verifying", password: "password", id: 4 },
  { username: "one_verification_failed", password: "password", id: 5 },
  { username: "applicant_user", password: "password", id: 6 },
  { username: "one_current", password: "password", id: 7 },
  { username: "no_cards", password: "password", id: 8 },
  { username: "one_current_no_expiration", password: "password", id: 9 },
  { username: "one_verifying_no_board", password: "password", id: 10 },
  { username: "one_unverified", password: "password", id: 11 }
];

const JWT = require("jsonwebtoken");
const q = require("q");

module.exports = {
  validateUser: (username, password) => {
    const deferred = q.defer();
    if (username === "internal_server_error" && password === "password") {
      deferred.reject({
        statusCode: 500,
        error: "Internal server error"
      });
    } else {
      let user = findUser(username, password);
      if (user) {
        JWT.sign(user, "someSecret", (err, token) => {
          if (err || !token) deferred.reject(err);
          else
            deferred.resolve({
              access_token: token,
              token_type: "bearer",
              expires_in: 86400,
              refresh_token: "test_refresh_token",
              ".issued": "Tue, Apr 17, 2018 11:54 AM",
              ".expires": "Tue, Apr 17, 2018 11:54 AM",
              audience: ["Evercheck-One", "wallet"],
              issuer: "https://auth.test.evercheck.com"
            });
        });
      } else {
        deferred.reject({
          statusCode: 400,
          error: "Invalid username or password."
        });
      }
    }
    return deferred.promise;
  }
};

function findUser(username, password) {
  return validUsers.find(user => {
    if (user.username === username && user.password === password) {
      return user;
    }
  });
}
