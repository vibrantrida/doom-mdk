const fs = require('fs')

const boilerplateConfig = require(process.cwd() + '\\boilerplate.config.json')
const projectConfig = require(process.cwd() + '\\project.config.json')

module.exports = {
  params: () => {
    let data = boilerplateConfig.playpal[projectConfig.playpal]
    let buffer = new Buffer.from(data, 'base64')
    if (!fs.existsSync(projectConfig.shortname)) {
      fs.mkdirSync(projectConfig.shortname)
      fs.writeFileSync(projectConfig.shortname + '\\PLAYPAL.pal', buffer)
    }
    return {
      ...boilerplateConfig,
      ...projectConfig
    }
  }
}
