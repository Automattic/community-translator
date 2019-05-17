const path = require('path');

module.exports = {
  mode: 'development',
  entry: './lib/index.js',
  output: {
	path: path.resolve( __dirname ),
    filename: 'community-translator.js'
  },
};
