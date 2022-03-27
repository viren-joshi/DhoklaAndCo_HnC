# IET_Plant_Disease_Detector
Plant Disease Detector
PLANT DISEASE DETECTION - DHOKLA&CO

APK IS UPLOADED IN THE GITHUB REPOSITORY

https://www.youtube.com/watch?v=jt1IOidOUrY / https://github.com/shivam5522/DhoklaAndCo_HnC

Plant Disease Detection.pptx

India is a cultivated country and 70% of our population belongs to the agricultural sector. Farmers undergo massive losses due to unavailability of proper knowledge and resources to detect and diagnose plant diseases. Plant diseases affect the growth of their respective species, therefore their early identification is very important. Identification of the plant diseases is the key to preventing the losses in the yield and quantity of the agricultural product. Health monitoring and disease detection on plant is very critical for sustainable agriculture. It is very difficult to monitor the plant diseases manually. It requires tremendous amount of work, expertise in the plant diseases, and also require the excessive processing time.
Our main aim is to detect the diseases in plants at an early stage which will help minimize the damage and loss and also provide the farmers with solutions to cure such diseases.

We see farmers in distress due to the inefficient crop produce. And as farmers are the backbone of this country, it is our duty to help them in any way we can. And this was our take on helping them by maximizing their produce by reducing agricultural waste and educating them about the various diseases of plants and how to cure them.

Tech Stack :

Flutter
Python
Flask
Firebase

Our app helps farmers to detect the diseases that their crops have. It is very convenient to use. The farmer has to click a picture of the leaf of the crop and then that image will be processed in our model and will show the farmer that is the crop healthy or it has some disease. If it has some disease then the app will provide some description regarding the disease which will educate the farmer about it and will also provide some solutions to cure as well as avoid the disease in the crops.

Solution:

We divided the whole workflow into 3 different parts:

FRONT END: The frontend was built using flutter as we wanted to build an app which would be convenient and portable for any person. The flutter app sends the image to firebase which stores the image. It then fetches the information using the FLASK API which returns the disease data of the crop.
BACKEND: We used Firebase for the backend as we have to store the image that is being passed from the front end. Firebase is very easy to use as well as to setup, making it easy for development as well.
SYSTEM APIs: For the front end and back end to communicate we used FLASK to implement APIs, we then hosted this api using ngrok. The API fetches the image from the database and runs the image in the model in python and the pushes the result to the frontend.
ML MODEL: As soon as we upload the image to the model, then the model compresses the image to a size of 256 by 256. Then the image is pre-processed using normalization, max-pooling and activation functions to form an array of just the highlightable parts of the leaf which is of size 15 and each index of the array corresponds to the most appropriate probabilities of each disease. There are a total of 58 million deciding parameters that help in building the probabilities of the diseases.
PROBLEMS FACED :
The first problem we faced was the accuracy of the model, we then used a much deeper and more complex model to train our data on.
Hosting and linking the Flask API to a global domain was another issue that we faced, as we had to upload our model, we had to face storage restrictions as we were using free hosting services. We then tackled it by using NGROK and ran the FLASK API locally.

FUTURE SCOPE :

Increase the scope of diseases that can be detected.
Connect farmers to professionals.
Recommend fertilizers and manure from various online stores for the detected disease.
