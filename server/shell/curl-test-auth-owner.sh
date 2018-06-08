BASE_URL=http://localhost:5000/api
ACCESS_TOKEN=d2xoAsCbzeJFEyZUjbD6QLpqOrXmdi1VIm7cmYsH06Z7WXox44uxa7dNp9QUujj4
WS_ID=5b1a1e9d4e6eac0e387a7180

echo -e "\n---------- LOGIN ----------"
curl -X POST -H "content-type: application/json" -d '{"email": "lucy@test.com", "password": "test"}' $BASE_URL/AppUsers/login
echo -e "\n---------- LIST WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/list
echo -e "\n---------- VIEW WS ----------"
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- EDIT WS ----------"
curl -X PATCH -H "Authorization: $ACCESS_TOKEN" -H "content-type: application/json" -d '{"name": "WS", "description": "ws"}' $BASE_URL/Workspaces/$WS_ID
echo -e "\n---------- DELETE WS ----------"
curl -X DELETE -H "Authorization: $ACCESS_TOKEN" $BASE_URL/Workspaces/$WS_ID
