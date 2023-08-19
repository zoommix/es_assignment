# Use the official Ruby image as the base
FROM ruby:3.2

# Install Python and required dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

RUN pip3 install -r bin/requirements.txt --break-system-packages

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["sh", "-c", "./bin/setup && rails server -b 0.0.0.0 -p 3000"]
