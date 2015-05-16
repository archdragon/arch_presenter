module ArchPresenter
  module ActionView
    module Helpers
      def present(target_object)
        Presenter.present(target_object)
      end
    end
  end
end
