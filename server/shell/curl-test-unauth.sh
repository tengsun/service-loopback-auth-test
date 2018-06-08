BASE_URL=http://localhost:5000/api
WS_ID=5b1a1493c6ea030a5a9181c7

echo -e "\n---------- LIST WS ----------"
curl -X GET $BASE_URL/Workspaces/list
echo -e "\n---------- VIEW WS ----------"
curl -X GET $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- EDIT WS ----------"
curl -X PATCH -H "Authorization: $ACCESS_TOKEN" -d '{"name": "WS", "description": "ws"}' $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- DELETE WS ----------"
curl -X DELETE $BASE_URL/Workspaces/$WS_ID
