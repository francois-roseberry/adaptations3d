import html from "eslint-plugin-html"
import js from "@eslint/js"

export default [{
    files: ["templates/**/*.html"],
    linterOptions: {
        reportUnusedDisableDirectives: "error"
    },
    languageOptions: {
        globals: {
            window: "readonly",
            document: "readonly",
            navigator: "readonly",
            localStorage: "readonly",
        },
    },
    plugins: {
        html,
    },
    settings: {
        "html/report-bad-indent": "error",
    },
    rules: js.configs.recommended.rules,
}]