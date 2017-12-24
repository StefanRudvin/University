class Read():
	def __init__(self):
		self.nodes = []
		self.distances = {}
		self.passengers = []
		self.taxis = []
		
		# Public transport variables
		self.PTNodes = []
		self.PTPassengers = []
		self.PTDistances = {}
		self.PTStartTimes = {}

		self.makePassengers()
		self.makeGraph()
		self.makePTPassengers()
		self.makePTGraph()

	def getNodes(self):
		return self.nodes

	def getPassengers(self):
		return self.passengers

	def getDistances(self):
		return self.distances

	def getPTNodes(self):
		return self.PTNodes

	def getPTDistances(self):
		return self.PTDistances

	def getPTStartTimes(self):
		return self.PTStartTimes

	def getPTPassengers(self):
		return self.PTPassengers

	def getTaxis(self):
		file = open("taxis.txt", "r")
		for line in file:
			self.taxis.append(line[0])
		return self.taxis

	def makePassengers(self):
		file = open("passengers.txt", "r")
		for line in file:
			fromNode = str(line.split(" ")[0])
			toNode = str(line.split(" ")[1])
			self.passengers.append((fromNode, toNode))

	def makePTGraph(self):
		file = open("publictransport.txt", "r")
		for line in file:
			fromNode = str(line.split(" ")[3])
			toNode = str(line.split(" ")[4])
			distance = int(line.split(" ")[2])
			startTime = int(line.split(" ")[0])
			every = int(line.split(" ")[1])

			if fromNode not in self.PTNodes:
				self.PTNodes.append(fromNode)
			if toNode not in self.PTNodes:
				self.PTNodes.append(toNode)

			# Add edges
			if fromNode not in self.PTDistances:
				self.PTDistances[fromNode] = {}

			if toNode not in self.PTDistances:
				self.PTDistances[toNode] = {}

			self.PTDistances[fromNode][toNode] = (distance)
			self.PTDistances[toNode][fromNode] = (distance)

			# Make startTimes for each edge/distance

			if fromNode not in self.PTStartTimes:
				self.PTStartTimes[fromNode] = {}
			if toNode not in self.PTStartTimes:
				self.PTStartTimes[toNode] = {}

			self.PTStartTimes[fromNode][toNode] = []
			self.PTStartTimes[toNode][fromNode] = []

			minutes = 1440

			for x in range(int(minutes / every)):
				departureTime = startTime + x*every

				self.PTStartTimes[fromNode][toNode].append(departureTime)
				self.PTStartTimes[toNode][fromNode].append(departureTime)


	def makePTPassengers(self):
		# Get user inputs
		file = open("publictransportpassengers.txt", "r")
		for line in file:
			fromNode = str(line.split(" ")[0])
			startTime = int(line.split(" ")[1])
			toNode = str(line.split(" ")[2])
			self.PTPassengers.append((fromNode, toNode, startTime))


	def makeGraph(self):
		file = open("nodes.txt", "r")
		for line in file:
			fromNode = str(line.split(" ")[0])
			toNode = str(line.split(" ")[1])
			distance = int(line.split(" ")[2])

			if fromNode not in self.nodes:
				self.nodes.append(fromNode)
			if toNode not in self.nodes:
				self.nodes.append(toNode)

			# Add edges
			if fromNode not in self.distances:
				self.distances[fromNode] = {}

			if toNode not in self.distances:
				self.distances[toNode] = {}

			self.distances[fromNode][toNode] = (distance)
			self.distances[toNode][fromNode] = (distance)

	def getPassengers2d(self):
		file = open("passengers2d.txt", "r")
		ar = []
		for line in file:
			fromNode = str(line.split(" ")[0])
			toNode = str(line.split(" ")[1])
			ar.append((fromNode, toNode))
		return ar