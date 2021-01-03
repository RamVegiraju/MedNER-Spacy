FROM python:3.8


#Virtual env
###########
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


#Pointing to project directory
###########
COPY . /app
WORKDIR /app


#Installing dependencies
############
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install https://s3-us-west-2.amazonaws.com/ai2-s2-scispacy/releases/v0.3.0/en_core_sci_sm-0.3.0.tar.gz



#Exposing for Flask
############
EXPOSE 5000
CMD python ./index.py
