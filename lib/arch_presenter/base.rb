module ArchPresenter
  class Base < ::SimpleDelegator
    def self.human_attribute_name(*args)
      original_class.human_attribute_name(*args)
    end

    def original_class
      presenter_class_name.chomp('Presenter').constantize
    end

    private

    def presenter_class_name
      self.class.to_s
    end
  end
end
