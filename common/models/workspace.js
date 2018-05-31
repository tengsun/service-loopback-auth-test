'use strict';

module.exports = function(Workspace) {

    Workspace.list = function(cb) {
        Workspace.find(function(err, workspaces) {
            let nameList = [];
            workspaces.forEach(ws => {
                nameList.push(ws.name);
            });
            cb(null, nameList);
        });
    };

    Workspace.remoteMethod('list', {
        http: { path: '/list', verb: 'get' },
        returns: { arg: 'workspaces', type: 'array' }
    })
};
