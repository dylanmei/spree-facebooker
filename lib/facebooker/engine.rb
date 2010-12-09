module SpreeFacebooker

  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate

      Spree::BaseController.class_eval do
        include Facebooker2::Rails::Controller
        helper Facebooker2::Rails::Helpers
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end