
from readfile import Read
from dijkstra import dijkstra

'''
identify the total travel time for all the passengers (by implementing an algorithm to do so). Describe the algorithm you used for this (justifying its use), and empirically evaluate its time complexity, comparing it to its worst case complexity.

'''

def main():
	read = Read()
	nodes = read.getNodes()
	distances = read.getDistances()
	passengers = read.getPassengers()
	
	finalSum = 0
	for route in passengers:
		finalSum += dijkstra(*route, nodes, distances)

	print(finalSum)

def timer(n):

	ar = []
	for i in range(1000):
		t = process_time()

		main(Taxitimes)

		elapsed_time = process_time() - t
		ar.append(elapsed_time)
	print(sum(ar) / float(len(ar)))

main()

