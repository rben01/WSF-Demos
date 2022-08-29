const HtmlWebpackPlugin = require("html-webpack-plugin");
// const CopyWebpackPlugin = require("copy-webpack-plugin");
const { WebpackDeduplicationPlugin } = require("webpack-deduplication-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const glob = require("glob");
const fs = require("fs");
const path = require("path");

module.exports = function (env, argv) {
	const modeIsProduction = argv.mode === "production";
	const mode = modeIsProduction ? "production" : "development";
	const distDir = modeIsProduction ? "dist" : "dist-dev";

	const demoDirs = glob
		.sync("./demos/*")
		.filter(item => fs.statSync(item).isDirectory());

	return demoDirs.map(dir => {
		const name = path.basename(dir);

		const entryPath = path.resolve(dir, "bootstrap.js");
		const entry = { [name]: entryPath };

		const output = {
			path: path.resolve(__dirname, distDir, name),
			library: "EntryPoint",
		};

		const plugins = [
			new HtmlWebpackPlugin({
				template: `./demos/${name}/index.html`,
				filename: "index.html",
				inject: true,
				chunks: [name],
			}),
			new WebpackDeduplicationPlugin({}),
		];

		const optimization = modeIsProduction
			? { minimize: true, minimizer: [new TerserPlugin()] }
			: {};

		return {
			name,
			entry,
			output,
			plugins,
			mode,
			optimization,
			experiments: { asyncWebAssembly: true },
			module: {
				rules: [
					{
						test: /\.css$/i,
						use: [
							{
								loader: "style-loader",
								options: { insert: "head" },
							},
							"css-loader",
						],
					},
				],
			},
		};
	});
};

console.log(module.exports({}, {}));

// const entries = Object.fromEntries(
// 	demoDirs.map(dir => {
// 		const name = path.basename(dir);
// 		return [name, path.resolve(dir, "bootstrap.js")];
// 	}),
// );
// const htmlWebpackPlugins = demoDirs.map(dir => {
// 	const name = path.basename(dir);
// 	return new HtmlWebpackPlugin({
// 		template: `./demos/${name}/index.html`,
// 		filename: `${name}.html`,
// 		inject: true,
// 		chunks: [name],
// 	});
// });

// module.exports = {
// 	entry: entries,
// 	output: {
// 		path: path.resolve(__dirname, "dist-dev"),
// 		filename(options) {
// 			return `[name].js`;
// 		},
// 		chunkFilename: "[name].[chunkhash].[fullhash].js",
// 	},
// 	mode: "development",
// 	plugins: [...htmlWebpackPlugins, new WebpackDeduplicationPlugin({})],
// 	experiments: { asyncWebAssembly: true },
// 	module: {
// 		rules: [
// 			{
// 				test: /\.css$/i,
// 				use: [
// 					{
// 						loader: "style-loader",
// 						options: { insert: "head" },
// 					},
// 					"css-loader",
// 				],
// 			},
// 		],
// 	},
// };
