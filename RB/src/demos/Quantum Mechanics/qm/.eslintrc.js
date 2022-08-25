module.exports = {
	env: {
		browser: true,
		node: true,
		es2021: true,
	},
	extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
	overrides: [],
	parser: "@typescript-eslint/parser",
	parserOptions: {
		ecmaVersion: "latest",
		sourceType: "module",
	},
	plugins: ["@typescript-eslint"],
	rules: {
		indent: ["error", "tab"],
		"linebreak-style": ["error", "unix"],
		quotes: ["error", "double"],
		semi: ["error", "always"],
		"@typescript-eslint/no-var-requires": false,
	},
	// eslintIgnore: [
	// 	".eslintrc.js",
	// 	"www/webpack.config.dev.js",
	// 	"www/webpack.config.js",
	// ],
};
