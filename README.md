# My Application

The project is generated by [LoopBack](http://loopback.io).

# Model, Role, ACL

- Models
AppUser
Workspace
	name, description, createTime
UserWorkspaceRel
	userId, workspaceId

- Roles
static: admin
dynamic: owner, member

- ACLs
		List WS 	View WS 	Edit WS 	Delete WS
$unauth 	x 			x 			x 			x
$auth		y			x 			x 			x
admin 		y			x 			x 			y
member 		y			y			x 			x
owner 		y			y			y 			x
