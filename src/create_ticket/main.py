import boto3
import uuid
import datetime
import json
import os

dynamodb = boto3.resource('dynamodb')
TABLE_NAME = os.environ.get('DYNAMODB_TABLE_NAME')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context): 

    try:
        body = json.loads(event['body'])

        user_id = body['UserID']
    except Exception as e :
        print(f"Error: Could not parse UserID from request. Details: {e}")
        
        return{
            'statusCode' : 400,
            'body': json.dumps({'message': 'UserID is required and must be in the request body.'})
        }