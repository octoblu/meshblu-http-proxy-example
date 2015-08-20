request = require 'request'
Meshblu = require 'meshblu'
MeshbluConfig = require 'meshblu-config'
debug = require('debug')('meshblu-http-proxy-example')

class Server
  constructor: ->
    @config = new MeshbluConfig

  run: =>
    @meshblu = Meshblu.createConnection @config.toJSON()
    @meshblu.on 'ready', =>
      debug 'ready'

    @meshblu.on 'message', @onMessage

  onMessage: (message) =>
    debug 'received message', message

    fromUuid = message.fromUuid
    url = 'http://requestb.in/ofkn1eof'
    options = {json: message.payload}

    request.post url, options, (error, response, body) =>
      return @sendError fromUuid, error if error?

      @sendMessage fromUuid, {
        statusCode: response.statusCode
        body: body
      }

  sendError: (uuid, error) =>
    debug 'sendError', uuid, error.message
    @meshblu.message uuid, {error: error.message}

  sendMessage: (uuid, message) =>
    debug 'sendMessage', uuid
    @meshblu.message uuid, message

server = new Server()
server.run()
