require 'spec_helper'

class TestThing; end

class NoMatchingPresenter; end

class TestThingPresenter < SimpleDelegator
  def name
    'Presented Test Thing'
  end
end

describe ArchPresenter do
  it 'has a version number' do
    expect(ArchPresenter::VERSION).not_to be nil
  end

  context 'when presenter exists' do
    it 'it adds presenter methods to the object' do
      test_thing = TestThing.new
      test_thing = ArchPresenter::Base.present(test_thing)
      expect(test_thing.name).to be == 'Presented Test Thing'
    end
  end
  context 'when presenter doesn\'t exist' do
    it 'returns the source object' do
      class_wihout_presenter = NoMatchingPresenter.new
      class_wihout_presenter = ArchPresenter::Base.present(class_wihout_presenter)
      expect(class_wihout_presenter.class).to be == NoMatchingPresenter
    end
  end
end
