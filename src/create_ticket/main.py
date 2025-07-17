#TOOLS NEEDED FOR THE FUNCTION TO RUN SMOOTH
import boto3
import uuid
import datetime
import json
import os
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

#LAMBDA FUNCTION

dynamodb = boto3.resource('dynamodb')
TABLE_NAME = os.environ.get('DYNAMODB_TABLE_NAME')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):

    # INPUT VALIDATION
    try:
        body = json.loads(event['body'])
    except Exception as e:
        logger.error(f"Error: Could not parse request body. Not valid JSON. Details: {e}")
        return {
            'statusCode': 400,
            'body': json.dumps({'message': 'Request body must be valid JSON.'})
        }

    # Use .get() for safer dictionary access and check for presence
    user_id = body.get('UserID')
    event_id = body.get('EventID')

    if not user_id or not event_id:
        logger.error(f"Error: Missing required fields. UserID: {user_id}, EventID: {event_id}")
        return {
            'statusCode': 400,
            'body': json.dumps({'message': 'Both UserID and EventID are required fields.'})
        }

    # DATA CREATION
    ticket_item = {
        'TicketID': str(uuid.uuid4()),
        'UserID': user_id,
        'EventID': event_id,
        'CreatedAt': datetime.datetime.utcnow().isoformat() + "Z",
        'Status': 'CONFIRMED'
    }

    # DATABASE WRITE AND RESPONSE 
    try:
        table.put_item(Item=ticket_item)
        logger.info(f"Successfully created ticket {ticket_item['TicketID']} for user {user_id} and event {event_id}")

        return {
            'statusCode': 201,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Credentials': True
            },
            'body': json.dumps({
                'message': 'Ticket was created successfully!',
                'TicketID': ticket_item['TicketID'],
                'EventID': ticket_item['EventID']
            })
        }
    except Exception as e:
        logger.error(f"Error: Could not write the ticket to DynamoDB. Details: {e}")

        return {
            'statusCode': 500,
            'body': json.dumps({'message': 'An internal error occurred while creating the ticket.'})
        }