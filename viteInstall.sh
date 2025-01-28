#!/bin/bash
read -p "Enter the Project Name: " projectName
npm create vite@latest $projectName -- --template react-ts
cd $projectName
npm install

read -p "Install Tailwind? (y/n) " tailwind
if [[ "$tailwind" == "y" ]]
then
  npm install tailwindcss @tailwindcss/vite

	echo "import { defineConfig } from 'vite'
  import tailwindcss from '@tailwindcss/vite'
  export default defineConfig({
    plugins: [
      tailwindcss(),
    ],
  })" > vite.config.ts

echo "@import "tailwindcss";" > ./src/index.css
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

export default App" > App.tsx

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
