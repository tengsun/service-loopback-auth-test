module.exports = function (app) {
    var AppUser = app.models.AppUser;
    var Role = app.models.Role;
    var RoleMapping = app.models.RoleMapping;
    var Workspace = app.models.Workspace;
    var UserWorkspaceRel = app.models.UserWorkspaceRel;

    // create users
    AppUser.create([
        { username: 'Jack', email: 'jack@test.com', password: 'test' },
        { username: 'Mike', email: 'mike@test.com', password: 'test' },
        { username: 'Lucy', email: 'lucy@test.com', password: 'test' }
    ], function (err, users) {

        console.log('Created users:', users);

        // create roles
        Role.create({
            name: 'admin'
        }, function (err, role) {
            if (err) throw err;

            console.log('Created role:', role);

            // make jack as admin
            role.principals.create({
                principalType: RoleMapping.USER,
                principalId: users[0].id
            }, function (err, principal) {
                if (err) throw err;

                console.log('Created principal:', principal);
            });
        });

        // create workspaces
        Workspace.create([
            { name: 'First Workspace', description: '1st workspace', createTime: new Date() },
            { name: 'Second Workspace', description: '2nd workspace', createTime: new Date() },
            { name: 'Third Workspace', description: '3rd workspace', createTime: new Date() }
        ], function (err, workspaces) {

            console.log('Created workspaces:', workspaces);

            // create user workspace relations
            // make mike as member, lucy as owner
            UserWorkspaceRel.create([
                { workspaceId: workspaces[0].id, userId: users[1].id, role: 'member' },
                { workspaceId: workspaces[0].id, userId: users[2].id, role: 'owner' }
            ], function (err, relations) {

                console.log('Create relations: ', relations);
            });
        });
    });

}
