/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["**/*.{dart,html}"],
  theme: {
    extend: {
      colors: {
        primary: {
          light: '#9C6BA6',
          dark: '#6F4180',
        },
        secondary: {
          light: '#D8B3E6',
          dark: '#4D4D4D',
        },
        background: {
          light: '#CFCFCF',
          dark: '#333233',
        },
        text: {
          light: '#333233',
          dark: '#CFCFCF',
        },
      },
    },
  },  
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

