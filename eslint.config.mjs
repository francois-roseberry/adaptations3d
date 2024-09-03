import htmlPlugin from "eslint-plugin-html"
import js from "@eslint/js"
import html from "@html-eslint/eslint-plugin"
import htmlParser from "@html-eslint/parser"

export default [{
    ...html.configs["flat/recommended"],
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
        parser: htmlParser,
    },
    plugins: {
        htmlPlugin,
        "@html-eslint": html,
    },
    settings: {
        "html/report-bad-indent": "error",
    },
    rules: {
        ...js.configs.recommended.rules,
        ...html.configs["flat/recommended"].rules,
        "@html-eslint/indent": "error",
        "@html-eslint/require-lang": "off",
    },
}]