
Clear-Host
Write-Output "############## WELCOME DEVELOPER 'PLUGDO NODE.JS' ##############" 
$NamaFile = Read-Host "Please enter your Name directory "
$Path = [Environment]::GetFolderPath('MyDocuments')
$OriginPath = $Path + '\' + $NamaFile

if (!(Test-Path -Path $OriginPath )) {
  New-Item -ItemType "directory" -Path "$Path\$NamaFile"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\content"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source\controllers"
  New-Item  -Path "$Path\$NamaFile\source\controllers" -Name "ctrl-pages.js" -Value 'mvc.controller({
      name: "customer",
      action: "index",
      path: "/",
      view:"index.ejs"
    }, function (req, ) {
      return {
        title: "Customer Home Page",
        message: "Welcome to our web page!"
    };
    });'
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source\dependencies"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source\plugdo"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source\plugdo\collector"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\source\integration"
  New-Item -ItemType "directory" -Path "$Path\$NamaFile\views" 
  New-Item  -Path "$Path\$NamaFile\views" -Name "index.ejs" -ItemType "file" -Value "<h1>Welcome Plugdo Node.js </h1>
    <hr>
  "
  New-Item -Path "$Path\$NamaFile"  -Name "server.js" -ItemType "file" -Value '
    const globalPath = process.env.PLUGDO_GLOBAL_PATH || "./source/app.config.js";
    global.settings = require(globalPath).settings()[process.env.PLUGDO_GLOBAL_ENV || "dev"];
    const server = require("@dellasera/plugdo-server").server();
    //server.mvc.webserver.use(require("./content/modules/upload/imagesUpload"));
    // server.mvc.webserver.use(require("./content/modules/sendEmail/sendEmail"));
    const path = require("path");
    const port = process.env.PORT === undefined ? 4000 : process.env.PORT;
    server.start(port, path.resolve(__dirname));'     
  New-Item -Path "$Path\$NamaFile"  -Name "save.sh" -ItemType "file" -Value '
    git init 
    git add.
    git status
  ' 
  New-Item -Path "$Path\$NamaFile"  -Name ".gitignore" -ItemType "file" -Value 'node_modules'  
  New-Item -Path "$Path\$NamaFile"  -Name ".rpmrc" -ItemType "file" -Value '//registry.npmjs.org/:_authToken=beca8b8e-f916-4b0e-92f9-6ff87ff94e1d'  
  New-Item -Path "$Path\$NamaFile\source"  -Name "app.config.js" -ItemType "file" -Value "const setting = {
  dev: {
    db: {
      user: ' ',
      password: '',
      host: '',
      database: '' 
    }
  },
  prod: {
    db: {
      user: '',
      password: '',
      host:'',
      database: ''
    },
    security: {
      rateLimit: {
        active: true,
        period: 1,
        limit: 1500
      },
      header: {
        active: true
      },
      origin: {
        active: true,
        domains: []
      }
    }
  }
}
exports.settings = function () {
  return setting;
}; "     
  New-Item -Path "$Path\$NamaFile" -Name "install-plugdo.ps1" -ItemType "file" -Value "npm init
     Write-Output '############## DOWNLOAD PLUGDO SERVER ##############'
     npm install @dellasera/plugdo-server --save 
     Remove-Item -Path install-plugdo.ps1 
     "
  Write-Output "############## ALL SUCCESS $Path\$NamaFile ##############" 
  Write-Output "PLUGDO NODE JS IS SUCCESS"
}
else {
  Write-Output "this File already exists $Path\$NamaFile"
}
