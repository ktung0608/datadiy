

# set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY datadiy.py .

EXPOSE 80
# ENTRYPOINT ["streamlit","run"]

# command to run on container start
#CMD ["./datadiy.py" ]

CMD ["sh", "-c", "streamlit run --browser.serverAddress 0.0.0.0 --server.enableCORS False --server.port 80 ./datadiy.py" ]