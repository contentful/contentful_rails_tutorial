# Creating your own Contentful and Rails Application

## Create your Rails project

```bash
$ rails init <YOUR_PROJECT_NAME>
```

## Add Contentful to your project dependencies

On your project's `Gemfile`:

```ruby
gem 'contentful'
```

## Ways to include Contentful in your project:

### Contentful as a View Helper

If you want to access Contentful API with a single configuration, this will be the simplest way to accomplish it.

On `app/helpers/application_helper.rb`:

```ruby
def contentful
  @client ||= Contentful::Client.new(
    access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
    space: ENV['CONTENTFUL_SPACE_ID'],
    dynamic_entries: :auto,
    raise_errors: true
  )
end
```

On your views then you can use it like follows:

```erb
<% products = contentful.entries(content_type: ENV['CONTENTFUL_PRODUCT_CT_ID'], include: 2) %>
<% products.each do |product| %>
  <div class="contentful_product">
    <h1><%= product.title %></h1>
    <img src="<%= product.image.first.image_url %>" />
    <p><%= product.description %></p>
    <a href="<%= product.website %>">Buy Now!</a>
  </div>
<% end %>
```

### Contentful as a Concern

If you want to have configurable Contentful instances for each Model on your application, you can do the following:

* Create `app/models/concerns/contentful_renderable.rb`

* On the newly created concern, add the following code:

```ruby
module ContentfulRenderable
  extend ActiveSupport::Concern

  def render
    client.entries(content_type: content_type_id, include: 2, 'sys.id' => contentful_id)
  end

  private

  def client
    @client ||= Contentful::Client.new(
      access_token: access_token,
      space: space_id,
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
```

* Add the fields to your Model:

```bash
$ rails g migration add_contentful_fields_to_<MODEL_NAME> access_token:string space_id:string content_type_id:string contentful_id:string
```

* Include Concern on your Model:

```ruby
class MyModel < ActiveRecord::Base
  include ContentfulRenderable
end
```

* Now you can use it on your views as follows:

Assuming our model is a Product

```erb
<% @products.map(&:render).each do |product| %>
  <div class="contentful_product">
    <h1><%= product.title %></h1>
    <img src="<%= product.image.first.image_url %>" />
    <p><%= product.description %></p>
    <a href="<%= product.website %>">Buy Now!</a>
  </div>
<% end %>
```

Using the Concern approach makes each of the instances of your model configurable.
If you want to pull out the configuration to a separate object, you are free to add a `belongs_to` relationship.
That way you can separate your Contentful Configuration from your models.

## This is just the beginning

This is just a very simple tutorial to get things running, but every project has different needs, and we want to provide you
with the best solutions we can.

## Providing Feedback

If you want to provide feedback or improve this tutorial, feel free to submit a Pull Request.
