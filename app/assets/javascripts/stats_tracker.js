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
		};

		this.getTotal = function(category) {
			var total = 0
			for (var i = 0; i < cats.players.length; i++) {
				total += cats.players[i][category];
			}
			return total
		};

		this.sortedBy = "number"
		this.sortReverse = false;

		this.sortBy = function(category) {
			if (this.sortedBy === category) {
				this.sortReverse = !this.sortReverse;
			} else {
				this.sortedBy = category;
			}
		};
	}]);
	app.directive("statsTracker", function() {
		return {
			restrict: "E",
			templateUrl: "stats_tracker.html"
		};
	});
})();