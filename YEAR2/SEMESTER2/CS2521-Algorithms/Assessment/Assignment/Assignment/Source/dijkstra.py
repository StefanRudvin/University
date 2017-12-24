# Heavily Inspired by a stackOverflow python implementation
def dijkstra(startNode, endNode, nodes, distances):
	unvisited = {}
	for x in nodes:
		unvisited[x] = None
	passed = {}
	thisNode = startNode
	currentDistance = 0
	unvisited[thisNode] = currentDistance

	while endNode not in passed:
		for neighbour, distance in distances[thisNode].items():

			# If neighbour is already visited skip

			if neighbour not in unvisited:
				continue

			newDistance = currentDistance + distance
			if unvisited[neighbour] is None or unvisited[neighbour] > newDistance:
				unvisited[neighbour] = newDistance
		passed[thisNode] = currentDistance
		del unvisited[thisNode]

		# Break once all unvisited nodes have been visited
		if not unvisited:
			break

		cands = []
		# Set next node to the smallest distance node in unvisited()
		for node in unvisited.items():
			if node[1]:
				cands.append(node)

		thisNode, currentDistance = sorted(cands)[0]

	return passed[endNode]