class Device
  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last.dup
  end

  private

  def record(recording)
    @recordings << recording
  end
end

listener = Device.new
listener.play
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"