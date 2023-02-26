FROM python:3.7.3-stretch

RUN python3 -m venv ~/.devops
RUN ~/.devops/bin/activate
## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN ~/.devops/bin/pip install --upgrade pip &&\
    ~/.devops/bin/pip install --upgrade setuptools &&\
    ~/.devops/bin/pip install -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["~/.devops/bin/python", "app.py"]

