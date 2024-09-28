# Dockerfile for book_catalog microservice

# The docker image is of amd64 architecture. 
FROM --platform=linux/amd64 python:3.11-slim

# The working directory inside the microservice to app
WORKDIR app

# The contents from the book_catalog from host machine will be transferred to the /app working directory
COPY ./book_catalog .

#Installing all the Python dependencies in the requirements.txt file under book_catalog
RUN pip install -r requirements.txt

#Our application will be listening on Port 4000
EXPOSE 3000

# Indicates how to start the application. Using Uvicorn to serve our FastAPI application that can be seen in main.py.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]

