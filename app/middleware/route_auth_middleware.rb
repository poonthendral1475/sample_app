class RouteAuthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    protected_paths = ['/help', '/contact','/about']

    if protected_paths.any? { |path| req.path.start_with?(path) }
      auth = Rack::Auth::Basic::Request.new(env)

      unless auth.provided? && auth.basic? && valid_credentials?(auth, req.path)
        return unauthorized_response
      end
    end

    @app.call(env)
  end

  private

  def valid_credentials?(auth, path)
    case path
    when %r{^/help}
      username = 'help'
      password = 'help123'
    when %r{^/contact}
      username = 'contact'
      password = 'contact123'
    when %r{^/about}
      username = 'about'
      password = 'about123'
    when %r{^/sidekiq}
      username = 'sidekiq'
      password = 'sidekiq123'
    else
      return false
    end

    auth.credentials == [username, password]
  end

  def unauthorized_response
    [
      401,
      { 'Content-Type' => 'text/plain', 'WWW-Authenticate' => 'Basic realm="Restricted Area"' },
      ['Unauthorized']
    ]
  end
end

