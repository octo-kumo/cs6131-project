module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parser: 'vue-eslint-parser',
  extends: [
    '@nuxtjs/eslint-config-typescript',
    'plugin:@typescript-eslint/recommended',
    'plugin:vue/recommended'
  ],
  parserOptions: {
    ecmaVersion: 2020
  },
  rules: {
    'quotes': 'off',
    'curly': 'off',
    'multiline-ternary': 'off',
    'quote-props': 'off',
    'object-curly-spacing': 'off',
    'space-before-function-paren': 'off',
    'no-return-assign': 'off',
    'vue/no-v-html': 'off',
    'vue/html-closing-bracket-spacing': 'off',
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    '@typescript-eslint/explicit-module-boundary-types': 'off',
    '@typescript-eslint/no-explicit-any': 'off',
    '@typescript-eslint/ban-ts-comment': 'off'
  }
}
