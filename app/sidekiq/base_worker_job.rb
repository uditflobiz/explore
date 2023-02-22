class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(test_arg)
    puts("xyz")
  end
end
