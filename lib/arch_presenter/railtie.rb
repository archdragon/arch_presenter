module ArchPresenter
  class Railtie < ::Rails::Railtie
    initializer "my_gem.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        include MyPresenter::ActionView::Helpers
      end

      ActiveSupport.on_load :action_controller do
        include MyPresenter::ActionController::Methods
      end
    end
  end
end
