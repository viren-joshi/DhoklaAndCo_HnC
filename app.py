import firebase_admin
from firebase_admin import db
from flask import Flask, request
from flask_cors import CORS
from plant import plant
from flask_ngrok import run_with_ngrok

key={
  "type": "service_account",
  "project_id": "iet-hack",
  "private_key_id": "15e6912b328af571ee4cdbefb709ce7b0eea0c89",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDf0ARV+1wFHh1Y\n5x+pdp7MEvDbHlqfFUypZ5QbHnq1UD5yoyavQLS3F8twCgm896G1BXm/4EVmrsUy\npYYmgSP7yrYJAt1J9UATuMJnsdy5zbcF7IAMx+MpXkbDxfupcbe2LkkeC9MQ+ecQ\nwuXSOPnV2nP5l8Z8u8WZCx3zeyK5OtEzkgvurdDqNQxk/9tAa6EWVqo9BCe8KBMl\nBYpmeweCfOJrbyF+mMV+6AX7VrvSnflz2AFT494FxkQydLyL3VeVgB8qrsGmkkwp\nUH56IJtLXb7FYB+j77a8ixNQXJqCrSBbKn95SS3u1UYeexSHFSvwPVM2+XiVwQ83\nH/II9VdRAgMBAAECggEANWZ/vlcetc7hYC6nGIsnqNflFVbo9teBZtMCnLTZQM0Q\nVVBVoM9+vsfD36vZdnecIuGXUr9rN6x/+w1Q1HuQDxnm9H/1Nhn4y6vT4KNon4F0\nh4qN497Gdb6bgkcI/H0YQPTKt8tI9R43MkHaTV4QSCTa8oSy1FyF8TXck9U/q/Np\nLd8E329TKuZjvFEAM+qernQQKwFwhFzx7MabUwzos+LTVcszBXdVO7lMXR7MGCqo\nW+m8hhYQCyryUYtXPvFoIXGy5f2ILkEg72D0qAlyUvkGtzj6nNYLXPbkAa+hKPCl\n/rgqAQmeNjc19iumUZEHM2AWTLVW/6+EO2b4MOe7lQKBgQDy1U9xTGuAfGmx9nLN\nve0dT9hANoFaD3MZoTG342gYj8rJZ4Khk4+Fomcx7iKFRmFp1DcbyQ1wrRPXcLMc\n3cRn8FTjfQ1IJi024XMl45JfW33Kvw37XdJFRdqB4ywl19pCyolRrt7Chr92Wk5J\n25iyrpjwAB/z4jqTZeIaFO0VPQKBgQDr8q/OsUTFuFzDrY7CW1tCxCtLCWtUg91B\nr5i8OTWSXYp8pK5Tvp0rIkQ+U1y4p3mU/Pt+mJFkzxfUz7XpykEUCrmqUKURylc4\nrRrXdN+N+QdvPwiGZo+mG02KUNwk4POePMJJdapohyO0Q4lk653b/daSdUbYWRA1\nLtsOJlGzpQKBgDkvBEMw9MvQAG/ZElXi2NijOdB9RV647qjlbbjZA2VtTxq4lmmI\nPy7//H8kjdqGpV/vin6vjMuw5lBAiN1OV/cGAGeFxj/sRY977crJWWm9ONUqwpck\nE+UeOwOFRJswxoQd/9JNdMWoR6QORgtcfAvv07IIxX2AE70sK99qeB4dAoGARXLH\nYJU44uGjHE2HiZmOQRawj4OUPeoaQ+1FjZFhPVWfH5TxYuDmLf4GDDpJPmi9Fqdn\n9xk9Imj6YL9KkifgA+AsSf82twfRqHL7RZO3AXjdQVdSUQz7Fy9OIXovcgNscZT8\nstaZc+7jCXofhL79VfVfJPi0A5YjeSPzgjSxM6kCgYEA7tqVh44CjR7JjllelytE\n8vB2oxnCFBmj2V7/d5ZKJGipzTa7f0Q+fU6UaB9BlVBUJMBtdgHwOMmb3Qz/0jzP\n/eLBAawDjK6ZqezDLqlqa/ftSD0ZuZiork6MjyGGKNX8qI0UPK6bnP34PIvDj+6C\nVcyqcYVCXozAPfvW0NUiVVA=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-xbly6@iet-hack.iam.gserviceaccount.com",
  "client_id": "104729526328192505715",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-xbly6%40iet-hack.iam.gserviceaccount.com"
}

cred_obj = firebase_admin.credentials.Certificate(key)
default_app = firebase_admin.initialize_app(cred_obj, {
	'databaseURL':'https://iet-hack-default-rtdb.firebaseio.com/'
	})


app=Flask(__name__)
CORS(app)
run_with_ngrok(app)

@app.route('/')
def home():
    return "Hello Welcome to the API homepage"

# Image API call

@app.route('/imageLink',methods=["POST"])
def imagelink():
    data=request.json
    image_link=data['link']
    return image_link

@app.route('/checkDisease',methods=["POST"])
def checkdisease():
    data=request.json
    image_link=data['link']
    # result=plant(image_link)
    # result['message']='Successful'
    # return result
    try:
        result=plant(image_link)
        result['message']='Successful'
        return result
    except:
        return {'message':'Unsuccessful'}


if __name__ == "__main__":
    app.run()

