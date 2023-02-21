require "redis"

# redis_url = "http://127.0.0.1:6379"

$redis = Redis.new(host: "127.0.0.1", port: 6379)