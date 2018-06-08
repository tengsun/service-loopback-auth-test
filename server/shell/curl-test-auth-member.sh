BASE_URL=http://localhost:5000/api
ACCESS_TOKEN=KrD0TYdgHNyxliTbXocdnG7Dxl8wNQhqKv5DCggMD0664qTyYvGAqf1vZr9a1Y3x
WS_ID=5b1a1e9d4e6eac0e387a7180

echo -e "\n---------- LOGIN ----------"
curl -X POST -H "content-type: application/json" -d '{"email": "mike@test.com", "password": "test"}' $BASE_URL/AppUsers/login
echo -e "\n---------- LIST WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/list
echo -e "\n---------- VIEW WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- EDIT WS ----------"
curl -X PATCH -H "Authorization: $ACCESS_TOKEN" -d '{"name": "WS", "description": "ws"}' $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- DELETE WS ----------"
curl -X DELETE -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
