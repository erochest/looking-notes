
"use strict";


exports.scannerOpen = function(selector) {
  var config = {
    inputStream: {
      type: "LiveStream",
      target: document.querySelector(selector),
      constraints: {
        facingMode: "user"
      }
    },
    decoder: {
      readers: ["ean_reader"]
    }
  };
  var attachListeners = function() {
    // TODO: cancel
  };

  // TODO: how to handle errors?
  Quagga.init(config, function(err) {
    if (err) {
      console.log(err);
      return;
    }
    attachListeners();
    Quagga.start();
  });
};

exports.scannerClose = function() {
  Quagga.stop();
};

