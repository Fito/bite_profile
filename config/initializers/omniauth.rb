Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :facebook,
    '617227541687520',
    'bc0fc7ae4b0a1283ea94bea8c78b92ef',
    { scope: 'offline_access,read_stream,publish_stream' }
  )
end
