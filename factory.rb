class Factory
  def self.new(*vars,&block)
    Class.new do

      attr_accessor *vars

      define_method :initialize do |*args|
          vars.each_with_index do |item,index|
            instance_variable_set("@#{item}", args[index])
          end
      end

      define_method :[] do |param|
        (param.is_a? Numeric) ? send("#{vars[param]}") : send(param)
      end

      class_eval(&block) if block_given?
    end
  end
end