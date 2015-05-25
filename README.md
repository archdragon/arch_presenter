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

### Super-quick example

Simple, skinny model:

```ruby
# app/models/user.rb
class User
  def first_name
    'John'
  end
  def last_name
    'Smith'
  end
  def title
    'Mr.'
  end
  def name_visible?
    true
  end
end
```

Presentation logic moved to the presenter:

```ruby
# app/presenters/user_presenter.rb
class UserPresenter < ArchPresenter::Base
  def display_name
    if name_visible? 
      [title, first_name, last_name].join(' ')
    else
      '(Name hidden)'
    end
  end
end
```

Presenting the object in the controller:

``` ruby
# app/controllers/users_cotroller.rb
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = present(@user)
  end
end
```

Using the `display_name` function:

```ruby
# app/views/users/show.html.erb
<h1><%=@user.display_name %> - User profile</h1>
```

### Creating presenter classes

First you will need to create a class that will be used to decorate your object.

Presenter class files should be placed in `app/presenters/` and should inherit from `ArchPresenter::Base`.

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

### Mini-tutorial

We have a user model that looks like this:

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  def first_name
    'John'
  end
  def last_name
    'Smith'
  end
  def title
    'Mr.'
  end
  def name_visible?
    true
  end
  def display_name
    if name_visible? 
      [title, first_name, last_name].join(' ')
    else
      '(Name hidden)'
    end
  end
end
```

where `first_name`, `last_name` and `title` are user table cloumns and `display_name` is only used to show the name while displaying information about the user. `display_name` doesn't really belong to the model and we want to move it to a separate class - the presenter.

We create a new file in `app/presenters` and move the `display_name` there:

```ruby
class UserPresenter < ActiveRecord::Base
  def display_name
    if name_visible? 
      [title, first_name, last_name].join(' ')
    else
      '(Name hidden)'
    end
  end
end
```

Now in our controller we can use the `present` method:

``` ruby
# app/controllers/users_cotroller.rb
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = present(@user)
  end
end
```

This will add the `display_name` method to our `@user`. We can now use it in the view:

```ruby
# app/views/users/show.html.erb
<h1><%=@user.display_name %> - User profile</h1>
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/arch_presenter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
