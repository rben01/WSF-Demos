const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const glob = require("glob");

const path = require("path");

const demoDirs = glob.sync("./demos/*");
const entries = Object.fromEntries(
	demoDirs.map(dir => {
		const name = path.basename(dir);
		return [name, path.resolve(dir, "bootstrap.js")];
	}),
);
const htmlWebpackPlugins = demoDirs.map(dir => {
	const name = path.basename(dir);
	return new HtmlWebpackPlugin({
		template: `./demos/${name}/index.html`,
		filename: `${name}.html`,
		inject: true,
		chunks: [name],
	});
});

module.exports = {
	entry: entries,
	output: {
		path: path.resolve(__dirname, "dist-dev"),
		filename(options) {
			return `[name].js`;
		},
	},
	mode: "development",
	plugins: [...htmlWebpackPlugins],
	experiments: { asyncWebAssembly: true },
	module: {
		rules: [
			{
				test: /\.css$/i,
				use: [
					{
						loader: "style-loader",
						options: { insert: "head", injectType: "singletonStyleTag" },
					},
					"css-loader",
				],
			},
		],
	},
};
