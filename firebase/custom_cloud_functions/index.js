const admin = require("firebase-admin/app");
admin.initializeApp();

const adminCreateUser = require("./admin_create_user.js");
exports.adminCreateUser = adminCreateUser.adminCreateUser;
