module.exports = function (app) {
    var AppUser = app.models.AppUser;
    var Role = app.models.Role;
    var RoleMapping = app.models.RoleMapping;
    var Workspace = app.models.Workspace;

    AppUser.create([
        { username: 'Jack', email: 'jack@test.com', password: 'test' },
        { username: 'Mike', email: 'mike@test.com', password: 'test' },
        { username: 'Lucy', email: 'lucy@test.com', password: 'test' }
    ], function (err, users) {

        console.log('Created users:', users);

        Role.create({
            name: 'admin'
        }, function (err, role) {
            if (err) throw err;

            console.log('Created role:', role);

            //make jack an admin
            role.principals.create({
                principalType: RoleMapping.USER,
                principalId: users[0].id
            }, function (err, principal) {
                if (err) throw err;

                console.log('Created principal:', principal);
            });
        });
    });

    Workspace.create([
        { name: 'First Workspace', description: '1st workspace', createTime: new Date() },
        { name: 'Second Workspace', description: '2nd workspace', createTime: new Date() },
        { name: 'Third Workspace', description: '3rd workspace', createTime: new Date() }
    ], function (err, workspaces) {

        console.log('Created workspaces:', workspaces);
    });
}
