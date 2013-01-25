require "delegate_attributes/version"

module DelegateAttributes
  def self.load!
    require 'delegate_attributes/engine'
    require 'delegate_attributes/railtie'
    warn <<-EOW

    DEPRECATION WARNING: Gem 'delegate_attributes' has been moved into 'active_tools' gem.
    Further development of 'delegate_attributes' will no longer continue.

    Thank you!

EOW
  end

end

DelegateAttributes.load!
