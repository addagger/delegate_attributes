require "delegate_attributes/version"

module DelegateAttributes
  def self.load!
    require 'delegate_attributes/engine'
    require 'delegate_attributes/railtie'
  end

end

DelegateAttributes.load!
