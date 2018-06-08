module.exports = function (app) {
    var Role = app.models.Role;
    var UserWorkspaceRel = app.models.UserWorkspaceRel;

    function checkUserWorkspaceRel(userRole) {
        Role.registerResolver(userRole, function (role, context, cb) {
            function reject() {
                process.nextTick(function () {
                    cb(null, false);
                });
            }
    
            // if the target model is not Workspace
            if (context.modelName !== 'Workspace') {
                return reject();
            }
    
            // do not allow anonymous users
            var userId = context.accessToken.userId;
            if (!userId) {
                return reject();
            }
    
            // check if userId is in team for the given Workspace id
            var workspaceId = context.modelId;
            var filter = { where: { and: [{workspaceId: workspaceId}, {userId: userId}] }};
            UserWorkspaceRel.findOne(filter, function (err, Relation) {
    
                if (err || !Relation || Relation.role !== userRole)
                    return reject();
    
                cb(null, true);
            });
        });
    }

    // register member role
    checkUserWorkspaceRel('member');

    // register owner role
    checkUserWorkspaceRel('owner');
};
