#!/bin/bash
read -p "Enter the Project Name: " projectName
npm create vite@latest $projectName -- --template react
cd $projectName
npm install

read -p "Install Tailwind? (y/n) " tailwind
if [[ "$tailwind" == "y" ]]
then
	npm install -D tailwindcss postcss autoprefixer
	npx tailwind init -p

	echo "export default {
  content: [
    \"./index.html\",
    \"./src/**/*.{js,ts,jsx,tsx}\",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}" > tailwind.config.js

echo " @tailwind base;
@tailwind components;
@tailwind utilities;" > ./src/index.css
fi

cd ./public
rm -r vite.svg
cd ../src
rm -r assets/
rm App.css
echo "import React from 'react'

const App = () => {
  return (
    <div>
      
    </div>
  )
}

export default App" > App.jsx

read -p "Open in VS Code? (y/n) " vs
if [[ "$vs" == "y" ]]
then
	cd ..
	code .
else
	echo "Write command: cd $projectName
	npm run dev"
	exit
fi

echo "Write command: npm run dev"

exit
