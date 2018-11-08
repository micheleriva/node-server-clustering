const fs   = require('fs')
const jimp = require('jimp')

module.exports = function runJob() {

  return new Promise(async (resolve, reject) => {

    const destFileName = `${__dirname}/../imgs/dest/${+ new Date()}-img.jpg`
    fs.copyFileSync(`${__dirname}/../imgs/landscape.jpg`, destFileName)
    const image = await jimp.read(destFileName)
    image.flip(true, false)
    fs.unlink(destFileName, (err) => {
      return err ? reject(err) : resolve('success')
    })
    
  })

}
