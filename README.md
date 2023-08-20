# README

This is a simple demo app powered by Ruby, Postgres, and ElasticSearch. It's not intended to be overly complex; rather, it serves as a straightforward example app to demonstrate how to utilize ElasticSearch via the Searchkick gem.

The app is dockerized and can be executed using docker-compose. There are three services: app, db, and elasticsearch. The app service represents the Rails app, the db service hosts the Postgres database, and the elasticsearch service runs the ElasticSearch instance.

## Wanna see it in action?
Visit [DEMOLINK](https://zoommix.me) to see the app in action. The app is hosted on raspberry pi, so don't expect blazing fast speeds. 😅

I hope the network stays strong, the Raspberry Pi manages ElasticSearch well, and the frpc tunnel keeps sending traffic smoothly from my home network to the Hetzner Cloud. 🤞

I was going to host it on Heroku, but the free tier doesn't support ElasticSearch. I could have used a third-party ElasticSearch service, but I wanted to keep it simple.

## How to run the app using docker-compose?

1. Clone the repository.
2. Create a `.env` file in the root of the project by copying the `.env.sample` file: `cp .env.sample .env`.
3. Execute `docker-compose up -d` to initiate the services. You can access the app at http://localhost:3000.

## What occurs when you run `docker-compose up -d`?

1. The app service constructs the image using the Dockerfile.
2. The db service fetches the PostgreSQL image from Docker Hub.
3. The elasticsearch service fetches the ElasticSearch image from Docker Hub.
4. Once the services are up and running (using `./bin/wait_for_services`).
5. The `./bin/setup` script will execute to configure the database.
6. The `./bin/import` script will run to import data from the Parquet file into the database. This is achieved using a simple Python script.
7. After the import is complete, the ElasticSearch index will be established and the data will be indexed.
8. You're now ready to run the Rails app, accessible at http://localhost:3000.

## How to run the app locally?

1. Clone the repository.
2. Create a `.env` file in the project root by copying the `.env.sample` file: `cp .env.sample .env`.
3. Install the required dependencies:
   * Ruby 3.2.2
   * Postgres 14 (ensure port 5432 is available)
   * ElasticSearch 7.15.0 (higher versions are untested with the Searchkick gem, ensure port 9200 is available)
   * Python 3+
4. Run `bundle install` to install the necessary gems.
5. Run `pip3 install -r bin/requirements.txt` to install the Python dependencies.
6. Execute `./bin/setup` to set up the database.
7. Use `rails s` to launch the app. Access it at http://localhost:3000.

## What's next? Improvements and more.

1. The app isn't production-ready; proper configuration of environment variables is necessary.
2. Additional testing is needed, particularly for the search functionality.
3. Implementing a CI/CD pipeline would be beneficial, possibly utilizing GitHub Actions or similar platforms.
4. Integration of an autosuggest feature during search would enhance user experience.
5. Enhancing the UI/UX design is required.
6. Implement pagination in the user interface.
7. Expand the UI with additional search filters.
8. Determine a meaningful purpose for utilizing this dataset! 😅
9. As for now, the dataset is static. But, if at some point it becomes dynamic, we'll need to implement a mechanism to update the index accordingly.
