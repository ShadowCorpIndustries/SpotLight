const db = require('./databaseGateway');

module.exports = {
    log: (type, message) => {
        db.maindb.get('admin.logs').push({
            "time": new Date(),
            type: type.name,
            message
        }).write();
        console.log(type.name, message);
    },
    getLogs: () => {
        return db.maindb.get('admin.logs').sortBy('time').reverse().value();
    }
}