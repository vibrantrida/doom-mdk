const fs = require('fs')

const projectConfig = require(process.cwd() + '\\project.config.json')

// get path to all sprites
// filter sprites
// set sprite offsets
const locateSprites = (dir) => {
  let results = []
  let list = fs.readdirSync(dir)
  list.forEach((file) => {
    file = dir + '/' + file
    let stat = fs.statSync(file)
    if (stat && stat.isDirectory()) {
      results = results.concat(locateSprites(file))
    } else {
      results.push(file)
    }
  })
  return results
} // locateSprites(dir)

const filterSprites = (sprites) => {
  let whitelist = ['png', 'jpeg', 'dds', 'pcx', 'tga']
  let results = []
  sprites.forEach((file) => {
    let fileExt = file.split('.').pop()
    if (whitelist.includes(fileExt)) {
      results.push(file)
    }
  })
  return results
} // filterSprites(sprites)

const offsetSprites = (sprites) => {
  let spriteTypes = ['Effects', 'Enemies', 'Items', 'Projectiles', 'Props', 'Skins', 'Weapons']
  let results = []
  sprites.forEach((file) => {
    let spriteName = file.split(/(\\|\/)/g).pop()
    spriteTypes.some((type) => {
      if (file.includes(type)) {
        if (['Effects', 'Projectiles'].includes(type)) {
          results.push({
            name: spriteName,
            path: file,
            offsets: [8, 8]
          })
        } else if (['Enemies', 'Props', 'Skins'].includes(type)) {
          results.push({
            name: spriteName,
            path: file,
            offsets: [16, 31]
          })
        } else if (type === 'Items') {
          results.push({
            name: spriteName,
            path: file,
            offsets: [32, 31]
          })
        }
      }
    })
  })
  return results
} // offsetSprites(sprites)

let files = locateSprites(`${projectConfig.shortname}/Sprites`)
let filtered = filterSprites(files)
let offsets = offsetSprites(filtered)

module.exports = {
  params: () => {
    let spritesConfig = {}
    spritesConfig.sprites = offsets
    return {
      ...projectConfig,
      ...spritesConfig
    }
  }
}
