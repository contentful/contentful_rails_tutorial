# Rails Product Demo

Simple Rails and Contentful Application.
This application is for Demo purposes.

[Contentful](https://www.contentful.com) provides a content infrastructure for digital teams to power content in websites, apps, and devices. Unlike a CMS, Contentful was built to integrate with the modern software stack. It offers a central hub for structured content, powerful management and delivery APIs, and a customizable web app that enable developers and content creators to ship digital products faster.

## Setup

* Install dependencies

```bash
bundle install
```

* Create and Seed Database

```bash
bundle exec rake db:create db:migrate db:seed
```

* Run Server

```bash
bundle exec rails s
```

## Viewing Data

The seed comes pre-loaded with a Read-Only Demo space.
You can view the content [here](http://localhost:3000/contentful_users/1)

## Using Custom Data

You can create your own Custom Data by following these steps:

* Create an Account in [Contentful](https://www.contentful.com/sign-up/#starter) or [Log In](https://app.contentful.com)
* Create a new Space with `Product` Template
* In the rails app, create a new Contentful Configuration with (obtained from [Contentful App](https://app.contentful.com)):
  * Your newly created Space ID - `Settings -> Space -> Space ID`
  * Production Delivery API Access Token - `APIs -> API Keys -> Website -> Production`
  * Product's Content Type ID - `Content Types -> Product -> JSON Preview -> "sys => id"` (`sys` is the Metadata block of the Content Type)
* Then press `Show` on your new Configuration to see it's contents

## Tutorial

For a Tutorial on how to create your own Rails Application using Contentful, you can read [here](./TUTORIAL.md)
