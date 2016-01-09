class User < ActiveRecord::Base
  belongs_to :addr, class_name: 'Address'

  def addr
    addr_inst = super

    addr_inst.instance_variable_set(:@_caller, self)

    addr_inst.class.send(:define_method, :_update_record) do
      return(super()) if changes.empty?

      new_record = self.class.new(self.attributes)
      new_record.id = nil
      new_record.updated_at = nil

      return(false) unless new_record.send(:_create_record)

      @_caller.addr = new_record

      unless @_caller.save == true
        raise("Unable to save dependent model: #{_caller.errors.full_messages}")
      end

      new_record.attributes.each { |k, v| self.send("#{k}=", v) }
      true
    end

    addr_inst
  end
end
