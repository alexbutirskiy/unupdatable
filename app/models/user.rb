class User < ActiveRecord::Base
  belongs_to :addr, class_name: 'Address'

puts 'HELLO!!!'

  def addr
    a = super

    a.class.class_eval('alias :old_save :save')
    a.instance_variable_set(:@_caller, self)

    a.class.send(:define_method, :save) do
      unless new_record?
        new_record = self.class.new(self.attributes)
        new_record.id = nil
        new_record.updated_at = nil
        retval = new_record.old_save

        @_caller.addr = new_record
        @_caller.save
        new_record.attributes.each { |k, v| self.send("#{k}=", v) }
        retval
      else
        super()
      end
    end

    a
  end
end
