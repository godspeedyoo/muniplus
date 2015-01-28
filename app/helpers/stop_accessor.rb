helpers do

  Stop = Struct.new(:data) do
    def stop(attr)
      self.data["table"][attr]
    end
  end



end
