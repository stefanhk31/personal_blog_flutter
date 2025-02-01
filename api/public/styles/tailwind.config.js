/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')

module.exports = {
  content: ["**/*.{dart,html}"],
  theme: {
    extend: {
      colors: {
        primary: colors.blue,
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}