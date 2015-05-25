# ArchPresenter

ArchPresenter is a simple, lightweight gem that implements the Presenter pattern.

It allows you to slim down your models and controllers by extracting the logic related to class presentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arch_presenter'
```

And then run:

    $ bundle


## Usage

### Creating presenter classes

First you will need to create a class that will be used to decorate your object.

Presenter class files should be placed in `app/presenters/`.

### Autoloading

You might wish to add `app/presenters/` to your autoload path. This will allow rails to automatically detect changes made to the presenter files without the need to restart the server.

In `config/application.rb` add:

```ruby
config.autoload_paths << Rails.root.join('app', 'presenters')
```

### Decorating

ArchPresenter gem provides a `#present` function that can be invoked in your controller (or in your view if you preffer decorating your classes there).

To decorate your class use the `#present` function.

In the controller:

```ruby
user = User.find(1)
@user = present(user)
```

or in the view:

```ruby
<body>
<% @user = present(@user) %>
Hello <%= @user.full_name %>!
</body>
```

### Simple example

We have a user model that looks like this:

```ruby
class User < ActiveRecors::Base
  def display_name
    [first_name, last_name].join(' ')
  end
end
```

where `first_name` and `last_name` are both user table cloumns and `display_name` is only used to show the full name in the while displaying information about the user.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/arch_presenter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
