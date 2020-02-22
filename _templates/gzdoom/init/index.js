const projectConfig = require(process.cwd() + '\\project.config.json')

module.exports = {
  params: () => {
    return {
      ...projectConfig
    }
  }
}
