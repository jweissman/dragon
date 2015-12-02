(function($, global) {
  var scheme   = 'ws://';
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  var handleWebsocketMessage = function(message) {
    console.log("----> ON MESSAGE");
    var data = JSON.parse(message.data);
    var content = data.content;
    console.log("content from server", content);
    $(".content").html(content);
  };

  //var submitPlayerCharacterOverWebsocket = function(event) {
  //  var data = JSON.stringify(form.serializeArray());
  //};

  var submitChoiceOverWebsocket = function(event) {
    console.log("SUBMIT");
    event.preventDefault();

    var form = $(".input-form");
    var data = JSON.stringify(form.serializeArray());
    console.log("data to send", data);
    ws.send(data); 
  };

  var orchestrateWebsockets = function() {
    ws.onmessage = handleWebsocketMessage;
    $(".input-form").on("submit", submitChoiceOverWebsocket);
  };

  var init_ws = function() {
    console.log(" ====> WELCOME TO DRAGON");
    orchestrateWebsockets();
  }

  if ($('body').is('.play')) {
    console.log("---> page body is #play");
    $(document).on('page:load', init_ws);
    $(document).ready(init_ws);
  }
}(jQuery, window));
