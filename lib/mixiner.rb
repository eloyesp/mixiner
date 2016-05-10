module Mixiner

  module_function

  def define_mixin_method base, module_name, method_name, &block
    mixin(base, module_name).define_method method_name, &block
  end

  def mixin base, module_name
    if base.const_defined? module_name, false
      base.const_get module_name
    else
      mod = Module.new do
        public_class_method :define_method
      end
      base.const_set module_name.capitalize, mod
      base.include mod
      mod
    end
  end
end
