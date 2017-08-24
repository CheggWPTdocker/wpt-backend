{
  debug: process.env.STATSD_DEBUG || false,
  log: {
    backend: process.env.STATSD_LOG_BACKEND || 'stdout',
    application: process.env.STATSD_LOG_APPLICATION || 'statsd',
    level: process.env.STATSD_LOG_LEVEL || 'LOG_INFO'
  },
  librato: {
    email: process.env.LIBRATO_EMAIL || 'default',
    token: process.env.LIBRATO_TOKEN || 'token',
    source: process.env.LIBRATRO_SOURCE || 'env'
  },
  backends: ["statsd-librato-backend"],
  port: 8125
}
