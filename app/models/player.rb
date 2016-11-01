class Player < ApplicationRecord
	before_validation :set_defaults

	def set_defaults
		self.points ||= 0
		self.rebounds ||= 0
		self.assists ||= 0
		self.blocks ||= 0
		self.steals ||= 0
		self.fouls ||= 0
	end
end
