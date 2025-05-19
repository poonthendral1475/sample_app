class ExampleJob
  include Sidekiq::Job

  def perform(name)
    puts "Hello #{name}, this job runs in the background!"
    sleep 20
    puts "Job done!"
  end
end

