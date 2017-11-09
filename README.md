Develoo - Apps, developed for you.

A two-sided marketplace built using Ruby on Rails

  

Initial setup and Development

  

This guide assumes that you know how to setup PostgreSQL on your computer. Develoo runs with PostgreSQL in development, production and testing. I suggest looking at the Postgres.App server started and the Postico database GUI utility if you’re on Mac.

First, fork this repository, then clone down your own fork to your computer.

Once downloaded, go into your command line interface (e.g. Terminal), and run the following command

```bundle install```

  

This will install all the required Gem files in order to be able to run the Develoo app.

You will have to set API keys as Environmental Variables.

You could either write these as ```export SECRET_KEY=”xxxxxxx”```` in your bash profile or use a gem like ```dot-env```.

To set up Environmental Variables directly on your machine, go into your command line interface and type ```open ~/.bash-profile```.You will need the following API, client and/or secret keys for the following services.

  

```export MAILGUN_API_KEY="XXXXXXXXXXXX"

export MAILGUN_DOMAIN="XXXXXXXX"

  

export PUBLISHABLE_KEY="XXXXXXXXXX"

export SECRET_KEY="XXXXXXXX"

export STRIPE_CLIENT_ID="XXXXXXXXXXXX"

  

export DEVELOO_DATABASE_PASSWORD="XXXXXXX"

  

export S3_BUCKET="XXXXXXXX"

export S3_KEY="XXXXXXXXXXXX"

export S3_SECRET="XXXXXXXXXX"

export S3_REGION="XXXXXXXXXXXX"

  

export EMAIL_TO="XXXXXXXXXXX”

```

These are key representations for Mailgun, Stripe, Amazon S3, and the email to which support emails sent via the website will be directed. Go to the mentioned services to obtain the API keys you need.

  
  

Once the bundle install command finishes, run ```rails db:create``` to create the required database tables in PostgreSQL. Ensure that your Postgres server is running already.

  

Next, run ```rails db:migrate``` to enact all of the database migrations into the newly created tables.Once that is done, there is also a seed.rb file to seedthe database with basc into. Run ```rails db:seed```  - NOTE, you will need to run this command to create the initial Super Admin account, that has access to the ActiveAdmin management console (located at &lt;domain&gt;/admin)

Once all of the above commands are run, you can start the server and the app by typing ```rails server``` and connect to ```localhost:3000```.You are now ready to use Develoo in production.Production

  

It is up to you how you choose to try uploading Develoo into production. This app was coded with deployment via Heroku and Amazon S3 in mind. Some gems (i.e Carrierwave) and some settings are configured specifically for this deployment scenario.Ensure if you are deploying to Heroku that you copy over the Environmental Variables into Heroku’s Config Vars.
