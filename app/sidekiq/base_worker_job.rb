class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options queue: 'low', retry: false

  def perform(test_arg)
    puts("xyz")
  end
end
