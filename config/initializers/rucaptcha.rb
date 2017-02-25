RuCaptcha.configure do
  # Color style, default: :colorful, allows: [:colorful, :black_white]
  # self.style = :colorful
  # Custom captcha code expire time if you need, default: 2 minutes
  # self.expires_in = 120
  # [Requirement/重要]
  # Store Captcha code where, this config more like Rails config.cache_store
  # default: Read config info from `Rails.application.config.cache_store`
  # But RuCaptcha requirements cache_store not in [:null_store, :memory_store, :file_store]
  # 默认：会从 Rails 配置的 cache_store 里面读取相同的配置信息，用于存储验证码字符
  # 但如果是 [:null_store, :memory_store, :file_store] 之类的，你可以通过下面的配置项单独给 RuCaptcha 配置 cache_store

  if Rails.env.production?
    config.cache_store = :dalli_store,
                        (ENV["MEMCACHIER_SERVERS"] || "").split(","),
                        {:username => ENV["MEMCACHIER_USERNAME"],
                         :password => ENV["MEMCACHIER_PASSWORD"],
                         :failover => true,
                         :socket_timeout => 1.5,
                         :socket_failure_delay => 0.2,
                         :down_retry_delay => 60
                        }
  else
    self.cache_store = :mem_cache_store
  end
end
