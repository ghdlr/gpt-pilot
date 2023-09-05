echo.
echo Creating configuration files...

:: Create Babel config
(
  echo {
  echo   "presets": ["@babel/preset-env"]
  echo }
) > babel.config.json

:: Create ESLint config
(
  echo {
  echo   "env": {
  echo     "browser": true,
  echo     "es2021": true
  echo   },
  echo   "extends": "eslint:recommended",
  echo   "parserOptions": {
  echo     "ecmaVersion": 12,
  echo     "sourceType": "module"
  echo   },
  echo   "rules": {
  echo   }
  echo }
) > .eslintrc.json

:: Create Prettier config
(
  echo {}
) > .prettierrc.json

:: Create Webpack config
(
  echo const path = require('path');
  echo 
  echo module.exports = {
  echo   entry: './src/index.js',
  echo   output: {
  echo     filename: 'bundle.js',
  echo     path: path.resolve(__dirname, 'dist'),
  echo   },
  echo };
) > webpack.config.js


echo.
echo Adding NPM Scripts...
:: This assumes package.json exists in the current directory and has a "scripts" field
npm install json --global
json -I -f package.json -e "this.scripts={'start':'electron .','build':'webpack --config webpack.config.js','lint':'eslint src/','format':'prettier --write src/*','transpile':'babel src --out-dir dist'}"

echo.
echo Creating folder structure...
mkdir src assets logs db

echo.
echo Setup complete.

endlocal
