require 'rails'

module DelegateAttributes
  class Railtie < ::Rails::Railtie
    config.before_initialize do
      ActiveSupport.on_load :active_record do
        require 'delegate_attributes/models/active_record_extension'
        include ActiveRecordExtension
      end
    end

  end
end