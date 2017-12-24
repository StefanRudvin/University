from readfile import Read
from dijkstra import dijkstra
from copy import deepcopy

'''
 Write a program to compute the time at which the last passenger(s) arrive at their destination; given the input files, as output, your program should return a single number — the time at which the last passenger(s) arrive at their destination.

'''
from Taxi2d import *

def allocation():
	read = Read()
	nodes = read.getNodes()
	distances = read.getDistances()
	taxis = read.getTaxis()

	passengers = read.getPassengers2d()

	final = []

	for cabRoute in taxis:
		ar = []
		for pasRoute in passengers:
			cabTime = dijkstra(cabRoute, pasRoute[0], nodes, distances)
			pasTime = dijkstra(*pasRoute, nodes, distances)
			ar.append(cabTime + pasTime)
		final.append(ar)

	finalCopy = deepcopy(final)

	# Main from Taxi2d - i.e. taxi allocation file
	row, col = main(final)

	maxVal = []
	for i in row:
		maxVal.append(finalCopy[i][row[i]])

	for i in col:
		maxVal.append(finalCopy[i][col[i]])

	print("Last passenger arrives at time:", max(maxVal))

allocation()
