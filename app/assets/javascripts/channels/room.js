App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message) ->
    const messagees = document.getElementById('messages')
    messages.innerHTML += message
    });'
    # Called when there's incoming data on the websocket for this channel

  speak: function(content){
    return this.perform('speak', {message: content});
  }

  document.addEventListener('DOMContentLoaded', function(){
    input = document.getElementById('chat-input')
    button = document.getElementById('button')
    button.addEventListener('click',function(){
      content = input.value
      App.room.speak(content)
      input.value = ''
    })
  })
