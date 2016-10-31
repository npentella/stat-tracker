// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


(function() {
	var app = angular.module("cats", [ ])
	app.controller("Cats", ['$http', function($http) {
		
		var cats = this;
		cats.players = [ ]
		$http.get('/players.json').success(function(data) {
			cats.players = data;
		});

		this.addStat = function(player, category) {
			player[category] += 1;
		};

		this.minusStat = function(player, category) {
			if (player[category]) {
				player[category] -= 1;
			}
		};

		this.save = function() {
			$http.put('/players', cats.players)
		}
	}]);
})();



























