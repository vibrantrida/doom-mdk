const fs = require('fs')

const projectConfig = require(process.cwd() + '\\project.config.json')

// get path to all scripts
const locateScripts = (dir) => {
  let results = []
  let list = fs.readdirSync(dir)
  list.forEach((file) => {
    file = dir + '/' + file
    let stat = fs.statSync(file)
    if (stat && stat.isDirectory()) {
      results = results.concat(locateScripts(file))
    } else {
      results.push(file)
    }
  })
  return results
} // locateScripts(dir)

const filterScripts = (sprites) => {
  let whitelist = ['z', 'zs', 'zc', 'zsc']
  let results = []
  sprites.forEach((file) => {
    let fileExt = file.split('.').pop()
    if (whitelist.includes(fileExt)) {
      results.push(file)
    }
  })
  return results
} // filterScripts(scripts)

let files = locateScripts(`${projectConfig.shortname}/ZScript`)
let filteredFiles = filterScripts(files)
let trimmedPaths = []
for (let i = 0; i < filteredFiles.length; i++) {
  trimmedPaths.push(filteredFiles[i].replace(`${projectConfig.shortname}/`, ''))
}

module.exports = {
  params: () => {
    let scriptsConfig = {}
    scriptsConfig.scripts = trimmedPaths
    return {
      ...projectConfig,
      ...scriptsConfig
    }
  }
}
