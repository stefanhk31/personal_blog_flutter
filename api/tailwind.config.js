/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["**/*.{dart,html}"],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

