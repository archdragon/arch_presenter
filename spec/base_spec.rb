require_relative 'spec_helper'

class TestThing; end

class NoMatchingPresenter; end

class TestThingPresenter < ArchPresenter::Base
  def name
    'Presented Test Thing'
  end
end

describe ArchPresenter::Base do
  describe '#original_class' do
    it 'returns the class that current presenter was based on' do
      test_thing = TestThing.new
      test_thing = ArchPresenter::Presenter.present(test_thing)
      expect(test_thing.original_class).to be == TestThing
    end
  end
end
