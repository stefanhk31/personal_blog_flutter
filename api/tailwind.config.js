/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["**/*.{dart,html}"],
  theme: {
    extend: {
      colors: {
        primary: {
          light: 'var(--color-primary-light)',
          dark: 'var(--color-primary-dark)',
        },
        secondary: {
          light: 'var(--color-secondary-light)',
          dark: 'var(--color-secondary-dark)',
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

