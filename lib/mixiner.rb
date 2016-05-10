module Mixiner
  def mixin module_name
    if self.const_defined? module_name, false
      self.const_get module_name
    else
      mod = Module.new do
        public_class_method :define_method
      end
      self.const_set module_name, mod
      self.include mod
      mod
    end
  end
end
