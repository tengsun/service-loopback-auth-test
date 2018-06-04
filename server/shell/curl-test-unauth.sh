BASE_URL=http://localhost:5000/api
WS_ID=5b148ff337367f59415d63b7

echo -e "\n---------- LIST WS ----------"
curl -X GET $BASE_URL/Workspaces/list
echo -e "\n---------- VIEW WS ----------"
curl -X GET $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- EDIT WS ----------"
curl -X PUT -d '{"name": "WS", "description": "ws", "createTime": {"2018-05-31T00:00:00Z"}}' $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- DELETE WS ----------"
curl -X DELETE $BASE_URL/Workspaces/$WS_ID
