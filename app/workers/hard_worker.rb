class HardWorker
  include Sidekiq::Worker

  attr_accessor :count
  def perform(*args)
    # Do something
  end
end
