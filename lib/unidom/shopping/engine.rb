module Unidom
  module Shopping

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Shopping

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
