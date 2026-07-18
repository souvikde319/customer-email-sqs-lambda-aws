import json
import boto3

ses = boto3.client("ses")


def lambda_handler(event, context):

    for record in event["Records"]:

        body = json.loads(record["body"])

        customer_name = body["customer_name"]
        email = body["email"]
        order_id = body["order_id"]
        amount = body["amount"]

        subject = "Order Confirmation"

        message = f"""
Hello {customer_name},

Your order has been placed successfully.

Order ID : {order_id}

Amount : ₹{amount}

Thank you for shopping with us.

Regards,
DevOps Store
"""

        response = ses.send_email(

            Source="techsj04@gmail.com",

            Destination={
                "ToAddresses": [
                    email
                ]
            },

            Message={
                "Subject": {
                    "Data": subject
                },

                "Body": {
                    "Text": {
                        "Data": message
                    }
                }
            }
        )

        print(response)

    return {
        "statusCode": 200
    }