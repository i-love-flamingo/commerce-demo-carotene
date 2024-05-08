module.exports = {
  plugins: [
    require('mqpacker')({
      sort: true
    }),
    require('autoprefixer'),
    require('postcss-plugin-px2rem')({
      rootValue: 16,
      unitPrecision: 5,
      propWhiteList: [],
      propBlackList: [],
      selectorBlackList: [],
      ignoreIdentifier: false,
      replace: true,
      mediaQuery: false,
      minPixelValue: 0
    }),
    require('postcss-object-fit-images')
  ]
}
