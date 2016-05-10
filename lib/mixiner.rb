# Make easy to create mixin modules to group together related methods.
#
# As those methods are not defined directly on the class those can be redefined
# afterwards.
#
# @example
#   class Settings
#     # make the mixin method available
#     include Mixiner
#
#     def initialize
#       @properties = {}
#     end
#
#     def property name, type
#       # define the methods in the mixin
#       mixin('Properties').define_method name do
#         @properties[name]
#       end
#
#       mixin('Properties').define_method "#{ name }=" do |value|
#         @properties[name] = value if value.kind_of? type
#       end
#     end
#
#     property limit, Integer
#     property name,  String
#
#     # overwrite the name writter with custom logic
#     def name= value
#       super value.capitalize
#     end
#
#   end
module Mixiner

  # Initialize or retrieve a mixin module for the given subject
  #
  # Create a mixin module to group a set of related methods making sure that
  # `define_method` is public so it is easier to add methods there.
  #
  # The module is defined just once and is included in the base class to make
  # those methods accessible.
  def mixin subject
    if self.const_defined? subject, false
      self.const_get subject
    else
      mod = Module.new do
        public_class_method :define_method
      end
      self.const_set subject, mod
      self.include mod
      mod
    end
  end
end
