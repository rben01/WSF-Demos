const path = require("path");
const config = require("./webpack.config.dev");

config.mode = "production";
config.output.path = path.resolve(__dirname, "dist");

module.exports = config;
