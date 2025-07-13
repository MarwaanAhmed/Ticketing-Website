#TOOLS NEEDED FOR THE FUNCTION TO RUN SMOOTH
import boto3
import uuid
import datetime
import json
import os


#LAMBDA FUNCTION

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
    
#CREATION OF THE DATA

    ticket_item = {
        'TicketID': str(uuid.uuid4()),
        'UserID': user_id,
        'CreatedAt': datetime.datetime.utcnow().isoformat() + "Z",
        'Status': 'CONFIRMED'
    }

#DATABASE WRITE AND RESPONSE
    try:
        table.put_item(Item=ticket_item)

        return{
            'statusCode' : 201,
            'headers' : {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Credentials': True
            },
            'body': json.dumps({
                'message': 'Ticket was created successfully!',
                'TicketID': ticket_item['TicketID']
            })
        }
    except Exception as e:
        print(f"Error: Could not write the ticket to the DynamoDB. Details: {e}")

        return{
            'statusCode': 500,
            'body': json.dumps({'message': 'An error occurred. '})
        }
    
    