module ArchPresenter
  module ActionController
    module Methods
      def present(target_object)
        Presenter.present(target_object)
      end
    end
  end
end
