const path = require("path");
const TerserPlugin = require("terser-webpack-plugin");

const config = require("./webpack.config.dev");

config.mode = "production";
config.output.path = path.resolve(__dirname, "dist");
config.optimization = {
	...config.optimization,
	splitChunks: {
		chunks: "all",
		minSize: 20000,
		maxSize: 200000,
		minRemainingSize: 0,
		minChunks: 1,
		maxAsyncRequests: 30,
		maxInitialRequests: 30,
		enforceSizeThreshold: 50000,
		cacheGroups: {
			defaultVendors: {
				test: /[\\/]node_modules[\\/]/,
				priority: -10,
				reuseExistingChunk: true,
			},
			default: {
				minChunks: 2,
				priority: -20,
				reuseExistingChunk: true,
			},
		},
	},
	minimize: true,
	minimizer: [new TerserPlugin()],
};

module.exports = config;
