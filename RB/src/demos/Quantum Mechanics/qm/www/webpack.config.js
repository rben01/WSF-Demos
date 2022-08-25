const path = require("path");
const TerserPlugin = require("terser-webpack-plugin");

const config = require("./webpack.config.dev");

config.mode = "production";
config.output.path = path.resolve(__dirname, "dist");
config.optimization = {
	minimize: true,
	minimizer: [new TerserPlugin()],
};

module.exports = config;
