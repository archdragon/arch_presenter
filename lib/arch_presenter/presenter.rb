module ArchPresenter
  class Presenter
    def self.present(target_object)
      presenter_class_name = "#{target_object.class}Presenter"
      class_constant = presenter_class_name.constantize
      class_constant.new(target_object)
    # If the presenter class doen't exist resturn the original object
    rescue NameError
      target_object
    end
  end
end
