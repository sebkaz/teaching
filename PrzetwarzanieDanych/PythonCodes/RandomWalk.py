#!/usr/bin/env python
# -*- coding: utf-8 -*-

from random import choice
import matplotlib.pyplot as plt


class RandomWalk(object):
	"""generowanie błądzenia losowego"""
	def __init__(self, num_points=5000):
		self.num_points = num_points
		self.x_values = [0]
		self.y_values = [0]

	def fill_walk(self):
		while len(self.x_values) < self.num_points:
			x_direction = choice([-1,1])
			x_distance = choice([0,1,2,3,4])
			x_step = x_direction*x_distance

			y_direction = choice([-1,1])
			y_distance = choice([0,1,2,3,4])
			y_step = y_direction*y_distance

			if x_step == 0 and y_step == 0:
			    continue

			next_x = self.x_values[-1] + x_step
			next_y = self.y_values[-1] + y_step

			self.x_values.append(next_x)
			self.y_values.append(next_y)


while True:

	rw = RandomWalk()
	rw.fill_walk()

	point_number = list(range(rw.num_points))
    plt.scatter(rw.x_values,rw.y_values, c=point_number, cmap=plt.cm.Blues, edgecolor='none', s=15)
    plt.scatter(0,0,c='green', edgecolor='none',s=100)
    plt.scatter(rw.x_values[-1],rw.y_values[-1], c='red',edgecolor='none', s=100)
	plt.show()

	keep_running = input("next ? (t/n)")
	if keep_running == 'n':
		break