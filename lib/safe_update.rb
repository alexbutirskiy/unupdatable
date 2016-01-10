module SafeUpdate
  def belongs_to(name, options = {})
    if options[:safe_update]
      options.except!(:safe_update)
      return_val = super(name, options)
      belongs_to_generator(name)
      return_val
    else
      super(name, options)
    end
  end

  private

  def belongs_to_generator(attr_name)
    define_method(attr_name) do
      attribute = super()

      attribute.instance_variable_set(:@_caller, self)

      attribute.class.send(:define_method, :_update_record) do
        return(super()) if changes.empty?

        new_record = self.class.new(attributes)
        new_record.id = nil
        new_record.updated_at = nil

        return(false) unless new_record.send(:_create_record)

        @_caller.send("#{attr_name}=", new_record)

        unless @_caller.save == true
          raise("Unable to save dependent model: #{_caller.errors.full_messages}")
        end

        new_record.attributes.each { |k, v| send("#{k}=", v) }
        true
      end

      attribute
    end
  end
end