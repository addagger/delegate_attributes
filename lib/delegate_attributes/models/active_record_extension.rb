require 'delegate_attributes/models/fake_errors'

module DelegateAttributes
  module ActiveRecordExtension
    extend ActiveSupport::Concern
  
    included do
    end
  
    module ClassMethods
    
      def delegate_attributes(*args)
        options = args.extract_options!
        writer_regexp = /=\z/
        readers = args.detect {|a| a !=~ writer_regexp}
        writers = args.detect {|a| a =~ writer_regexp}
        if options[:writer] == true
          writers += readers.map {|a| a << "="}
        end
        
        class_eval do
          delegate *(readers + writers), :to => options[:to]
        end          
        
        unless options[:errors] == false
          class_eval <<-EOV
            validate do
              object = #{options[:to]}
              if !object.valid? #{"&& object.instance_variable_set(:@errors, DelegateAttributes::FakeErrors.new(object))" if options[:errors].to_sym == :fit}
                object.errors.messages.each do |attribute, suberrors|
                  suberrors.each do |suberror|
                    errors.add(attribute, suberror)
                  end
                end
              end
            end
          EOV
        end
      end
    
    end
  
  end
end