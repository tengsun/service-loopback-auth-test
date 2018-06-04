BASE_URL=http://localhost:5000/api
ACCESS_TOKEN=K2qdtHWU3CU4rplXzwc0azBSNN1R4FOnrMXy5jDEq9G2UbIwIntL1zhz9TJ5tKc4
WS_ID=5b1495f0ab11a75b0da98404

# echo -e "\n---------- LOGIN ----------"
# curl -X POST -H "content-type: application/json" -d '{"email": "mike@test.com", "password": "test"}' $BASE_URL/AppUsers/login
echo -e "\n---------- LIST WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/list
echo -e "\n---------- VIEW WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- EDIT WS ----------"
curl -X PUT -H "Authorization: $ACCESS_TOKEN" -d '{"name": "WS", "description": "ws", "createTime": {"2018-05-31T00:00:00Z"}}' $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- DELETE WS ----------"
curl -X DELETE -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
