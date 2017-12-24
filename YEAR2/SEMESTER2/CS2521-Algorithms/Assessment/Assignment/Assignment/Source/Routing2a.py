from readfile import Read
from time import process_time

class Main():
	def __init__(self):
		read = Read()
		self.passengers = read.getPTPassengers()
		self.nodes = read.getPTNodes()
		self.distances = read.getPTDistances()
		self.startTimes = read.getPTStartTimes()

	def run(self):
		for route in self.passengers:
			self.dijkstra(*route)

	# Inspired by a stackOverflow python implementation
	def dijkstra(self, startNode, endNode, startingTime):
		path = []
		unvisited = {}
		for node in self.nodes:
			unvisited[node] = None

		visited = {}
		parent = {}
		for node in self.nodes:
			parent[node] = []
		current = startNode
		currentDistance = 0
		unvisited[current] = currentDistance
		currentTime = {}
		for node in self.nodes:
			currentTime[node] = startingTime

		while endNode not in visited:

			currentTime[current] = unvisited[current] + currentTime[current]

			#print(currentTime[current])

			# First, current = startNode. Go through current node's neighbours and distances to them
			for neighbour, distance in self.distances[current].items():
				# If neighbour is already visited skip
				if neighbour not in unvisited:
					continue

				for a,b in enumerate(self.startTimes[current][neighbour]):
					if b >= currentTime[current]:
						departureTime = b
						break

				waitTime = departureTime - currentTime[current]

				newDistance = currentDistance + distance + waitTime

				if unvisited[neighbour] is None or unvisited[neighbour] > newDistance:
					parent[neighbour] = (current, departureTime, neighbour)
					unvisited[neighbour] = newDistance

					#print("Distance from A to " , neighbour, ": " , newDistance)

			# Set the minimum distance to current node and push it to visited[]
			visited[current] = currentDistance + startingTime

			del unvisited[current]
			# Break once all unvisited nodes have been visited
			if not unvisited:
				break

			# Set next node to the smallest distance node in unvisited()
			cands = []
			# Set next node to the smallest distance node in unvisited()
			for node in unvisited.items():
				if node[1]:
					cands.append(node)
			current, currentDistance = sorted(cands)[0]
		
		self.makePath(parent, endNode, path, startNode)
		path.reverse()
		self.printPath(path)
		path = []
		print("")
		return

	def printPath(self, path):
		for i in path:
			print(i[0], i[1], i[2])

	def makePath(self, parent, j, path, startNode):
		if j == startNode:
			return
		path.append(parent[j])
		self.makePath(parent, parent[j][0], path, startNode)

main = Main()

def timer():

	ar = []
	for i in range(1000):
		t = process_time()

		main.run()

		elapsed_time = process_time() - t
		ar.append(elapsed_time)
	print(sum(ar) / float(len(ar)))

timer()