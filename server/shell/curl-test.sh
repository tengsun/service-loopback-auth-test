BASE_URL=http://localhost:5000/api
ACCESS_TOKEN=6Nb2ti5QEXIoDBS5FQGWIz4poRFiBCMMYJbYXSGHWuulOuy0GTEuGx2VCEVvbpBK

# Authorization Header
curl -X GET -H "Authorization: $ACCESS_TOKEN" $BASE_URL/widgets

# Query Parameter
curl -X GET $BASE_URL/widgets?access_token=$ACCESS_TOKEN
