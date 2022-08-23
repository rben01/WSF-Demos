const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const path = require("path");

module.exports = {
	entry: "./bootstrap.js",
	output: {
		path: path.resolve(__dirname, "dist"),
		filename: "bootstrap.js",
	},
	mode: "development",
	plugins: [
		new CopyWebpackPlugin({ patterns: ["index.html"] }),
		new HtmlWebpackPlugin({
			template: "index.html",
			inject: true,
			chunks: ["index"],
			filename: "index.html",
		}),
	],
	experiments: { asyncWebAssembly: true },
};
