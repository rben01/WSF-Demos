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
		"@typescript-eslint/no-var-requires": 0,
		"@typescript-eslint/no-non-null-assertion": 0,
		"@typescript-eslint/no-explicit-any": 0,
		"no-mixed-spaces-and-tabs": 0,
		"@typescript-eslint/no-unused-vars": [
			"error",
			{
				varsIgnorePattern: "^_",
				argsIgnorePattern: "^_",
				destructuredArrayIgnorePattern: "^_",
			},
		],
	},
	// eslintIgnore: [
	// 	".eslintrc.js",
	// 	"www/webpack.config.dev.js",
	// 	"www/webpack.config.js",
	// ],
};
