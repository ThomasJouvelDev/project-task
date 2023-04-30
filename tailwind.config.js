/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*',
  ],
  theme: {
    extend: {
      colors: {
        'poor': '#9d9d9d',
        'common': '#ffffff',
        'uncommon': '#1eff00',
        'rare': '#0070dd',
        'epic': '#a335ee',
        'legendary': '#ff8000',
      },
    },
  },
  plugins: [],
}

