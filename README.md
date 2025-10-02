# This is an automated table that scrapes updated League results from wikipedia and populates the table accordingly. 

TODO:
1) Github Actions to automate the scraping and production of the final artifact. -- Done
2) Containerization of the Table Content -- Done
3) Kubernetes Container orchestration and TLS Binding on an nginx Load Balancer.
<img width="330" height="290" alt="Image" src="https://github.com/user-attachments/assets/8b92e92f-1a66-463a-99be-d1d8c1d1ed41" />
<img width="800" height="800" alt="Image" src="https://github.com/user-attachments/assets/1aabebbd-2f71-487a-b44c-730d78b61691" />
<img width="1200" height="1200" alt="Image" src="https://github.com/user-attachments/assets/4b8834c6-8830-4e37-aaad-e631dcb3250e" />
<img width="183" height="42" alt="Image" src="https://github.com/user-attachments/assets/ef3c7264-e59b-4167-8a9d-32c577dab203" />


[fidelitylogo.html](https://github.com/user-attachments/files/22663586/fidelitylogo.html)

!![Screenshot from 2023-04-09 00-05-40](https://user-images.githubusercontent.com/25004712/230755473-6a21a413-5ad8-4bb2-9b3f-e7764d059ffa.png)

![Screenshot from 2022-03-14 13-21-49](https://user-images.githubusercontent.com/25004712/158236482-333ade08-a2ad-4ff3-be3f-487dc72ae81f.png)

STEP 1: External API call triggers the Pipeline (Postman in my case)

STEP 1': The Pipeline is also triggered via a Cron Job scheduler. (The Goal here is to capture weekday matches and have the most recent Dashboard as possible)

STEP 2: The Pipeline checks out the EPL Dashboard source code from its repository and begins the Build and Publish process.

STEP 3: Docker Hub Credentials are sort after and defined as variables during the Pipeline runtime.

STEP 4: The Source code is built in to a Docker Image and then pushed to an existing registry name within Docker Hub.

STEP 5: This is the end result of STEP 4, the built Docker Image is domicilled within the Docker Hub Registry.

STEP 6: The Container run and s3 Bucket push Stage is triggered.

STEP 7: At the Container run and s3 Bucket push Stage, the Docker Image is sort after in order to provision a Docker Image.

STEP 8: Amazon Web Services (AWS) credentials are then supplied on to the Container (As at Container run time) in order to access AWS s3 Bucket resources.

STEP 9: The R Code webscrapes English Premier League data from Wikipedia as the R code base builds within the Docker Container.

STEP 10: The Final Artifact is published to an s3 Bucket domicilled within Amazon Web Services (AWS)

STEP 11: The most recent English Premier League Table can be viewed from within the s3 Bucket. (This stage illustrates the dashboard from within the s3 Bucket)
