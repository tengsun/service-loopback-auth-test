var server = require('./server');

var ds = server.dataSources.mongo_db;
var lbTables = ['User', 'AccessToken', 'ACL', 'Role', 'RoleMapping'];

ds.automigrate(lbTables, function (er) {
    if (er) throw er;
    console.log('Loopback tables [' + lbTables + '] created in ' + ds.adapter.name);
    ds.disconnect();
});
