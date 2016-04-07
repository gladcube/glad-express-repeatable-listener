count = 0

module.exports = ({port, interval}, app)->
  do listen = ->
    emitter = set-timeout ->
      app.emit \listen
    , interval + 300_ms
    app.listen port
      ..on \error, ({code})->
        if code is \EADDRINUSE
          clear-timeout emitter
          console.error "Failed to listen on 80. \##{count++}"
          set-timeout listen, interval

