import HtmlWebpackPlugin from "html-webpack-plugin";
import { WebpackDeduplicationPlugin } from "webpack-deduplication-plugin";
import TerserPlugin from "terser-webpack-plugin";
import glob from "glob";
import fs from "fs";
import path from "path";

export default function (env, argv) {
	const modeIsProduction = argv.mode === "production";
	const mode = modeIsProduction ? "production" : "development";
	const distDir = modeIsProduction ? "dist" : "dist-dev";

	const demoDirs = glob
		.sync("./demos/*")
		.filter(item => fs.statSync(item).isDirectory());

	return demoDirs.map(dir => {
		const name = path.basename(dir);

		const entryPath = path.resolve(dir, "bootstrap.ts");
		const entry = { [name]: entryPath };

		const output = {
			path: path.resolve("./", distDir, name),
			module: true,
		};

		const plugins = [
			new HtmlWebpackPlugin({
				template: `./demos/${name}/index.html`,
				filename: "index.html",
				chunks: [name],
				inject: true,
				minify: true,
				scriptLoading: "module",
			}),
			new WebpackDeduplicationPlugin({}),
		];

		const optimization = modeIsProduction
			? {
					minimize: true,
					minimizer: [
						new TerserPlugin({
							extractComments: false,
							terserOptions: {
								ecma: 2020,
								compress: true,
								mangle: true,
								module: true,
							},
						}),
					],
			  }
			: {};

		const module = {
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
				{
					test: /\.tsx?$/,
					use: "ts-loader",
					exclude: /node_modules/,
				},
			],
		};

		return {
			name,
			entry,
			output,
			plugins,
			mode,
			optimization,
			module,
			resolve: {
				extensions: [".tsx", ".ts", ".js"],
			},
			experiments: {
				asyncWebAssembly: true,
				outputModule: true,
				topLevelAwait: true,
			},
		};
	});
}
