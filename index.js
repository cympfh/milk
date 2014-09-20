addon = require('./cc/build/Release/milk.node');
coffee = require('./coffee/index.js');

(function () {
  var fn;
  for (fn in addon)  exports[fn] = addon[fn];
  for (fn in coffee) exports[fn] = coffee[fn];
}());
