require 'test_helper'

describe 'Framework configuration' do
  it 'keeps separated copies of the configuration' do
    framework_configuration = Lotus::View.configuration
    card_configuration      = CardDeck::View.configuration

    framework_configuration.wont_equal(card_configuration)
  end

  it 'sets a root path' do
    card_configuration = CardDeck::View.configuration
    card_configuration.root.must_equal(Pathname.new('test/fixtures/templates/card_deck').realpath)
  end

  it 'sets a layout' do
    card_configuration = CardDeck::View.configuration
    card_configuration.layout.must_equal(CardDeck::ApplicationLayout)
  end

  it 'allow views to inherith the layout' do
    view_configuration = CardDeck::Views::Dashboard::Index.configuration
    view_configuration.layout.must_equal(CardDeck::ApplicationLayout)
  end

  it 'allow views to specify a layout'
  # TODO move all the values into the configuration:
  #
  #   * format
  #   * layout
  #   * root
  #   * template
  #
  # TODO move all the inherith logic into configuration:
  #
  #   Instead of HelloWorldView.subclasses, use HelloWorldView.configuration.views
  #
  # This also helps to have an unified API to load the framework Configuration#load! vs
  # Lotus::View::Inheritable#load!
  #
  # it 'allow views to specify a layout' do
  #   view_configuration = CardDeck::Views::Dashboard::JsonIndex.configuration
  #   view_configuration.layout.must_be_nil
  # end
end
