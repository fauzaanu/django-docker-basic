# Use an official Python runtime as a parent image
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Copy the entire project directory into the container
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]