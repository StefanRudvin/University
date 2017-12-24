from time import process_time
from random import *

# CS 2521 Assignment - Allocation algorithm

Taxitimes = [
[ 9,11,14,11, 7],
[ 6,15,13,13,10],
[12,13, 6, 8, 8],
[11, 9,10,12,9 ],
[7 ,12,14,10,14]
]
TaxitimesOG = [
[ 9,11,14,11, 7],
[ 6,15,13,13,10],
[12,13, 6, 8, 8],
[11, 9,10,12,9 ],
[7 ,12,14,10,14]
]

def main(ar):
	global rowDict
	global colDict
	global PasNum

	PasNum = len(ar[1])

	completed = False

	subMinRow(ar)
	subMinColumn(ar)

	# First step complete

	while not completed:

		rowDict = {}
		colDict = {}

		rowScan(ar)

		if not zerosCovered(ar):
			# print("Zeros not covered")
			colScan(ar)

		# Check whether num of marked is equal to num of rows in the matrix
		# print((len(rowDict) + len(colDict)))
		if (len(rowDict) + len(colDict)) != PasNum:
			# print("## Num of lines != num of rows!")
			minVal = minValunDeleted(ar)

			# print(minVal, "being subtracted from undeleted and added to intersections")
			ar = addMinValToIntersections(ar, minVal)
			ar = subMinFromUndeleted(ar, minVal)

		else:
			print("Optimal solution found")
			completed = True
	
	return rowDict,colDict

def printAllocations(row, col):
	for i in row:
		print("Taxi", i + 1, "Allocated to passenger", row[i] + 1, "for cost ", TaxitimesOG[i][row[i]])

	for i in col:
		print("Taxi", col[i] + 1, "Allocated to passenger", i + 1, "for cost ", TaxitimesOG[i][col[i]])

def addMinValToIntersections(ar, minVal):
	# Get x,y values from rowDict & colDict to get intersections
	for i in range(PasNum):
		if i in rowDict.values():
			for j in range(PasNum):
				if colDict.get(j) != None:
					ar[j][i] += minVal
	return ar

def subMinFromUndeleted(ar, minVal):
	for i in range(PasNum):
		if i not in rowDict.values():
			for j in range(PasNum):
				if colDict.get(j) == None:
					ar[j][i] -= minVal
	return ar

def getUndeleted(ar):
	undeleted = []
	for i in range(PasNum):
		if colDict.get(i) == None:
			for j in range(PasNum):
				if j not in rowDict.values():
					undeleted.append(ar[i][j])
	return undeleted

def minValunDeleted(ar):
	return min(getUndeleted(ar))

def zerosCovered(ar):
	for i in range(PasNum):
		for j in range(PasNum):
			if ar[i][j] == 0:
				if rowDict.get(i) == None:
					return False
	return True

def rowScan(ar):
	for i in range(PasNum):
		zeroCount = []
		for j in range(PasNum):
			if j not in rowDict.values():
				if ar[i][j] == 0:
					zeroCount.append((i, j))
		if len(zeroCount) == 1:
			rowDict[zeroCount[0][0]] = zeroCount[0][1]

def colScan(ar):
	for i in range(PasNum):
		if i not in rowDict.values():
			col = [row[i] for row in ar]
			zeroCount = []
			for j in range(PasNum):
				if j not in colDict.values():
					if ar[j][i] == 0:
						zeroCount.append((i, j))
			if len(zeroCount) == 1:
				colDict[zeroCount[0][0]] = zeroCount[0][1]

def existsZeros(ar):
	return True

#Subtract the smallest entry in each row from all entries in the row.
def subMinRow(ar):
	for i in range(PasNum):
		minVal = min(ar[i])
		for j in range(PasNum):
			ar[i][j] -= minVal

#Subtract the smallest entry in each column from all entries in the column.
def subMinColumn(ar):
	for i in range(PasNum):
		col = [row[i] for row in ar]
		minCol = min(col)
		for j in range(PasNum):
			ar[j][i] -= minCol

def printAr(ar):
	print("")
	for i in range(PasNum):
		print(ar[i])
	print("")

def timer(n):

	PasNum = n

	Taxitimes = []
	for i in range(PasNum):
		ar = []
		for j in range(PasNum):
			ar.append(randint(0,20))
		Taxitimes.append(ar)

	print(Taxitimes)

	TaxitimesOG = Taxitimes

	ar = []
	for i in range(1000):
		t = process_time()

		main(Taxitimes)

		elapsed_time = process_time() - t
		ar.append(elapsed_time)
	print(sum(ar) / float(len(ar)))
	

if __name__ == '__main__':
	row, col = main(Taxitimes)
	printAllocations(rowDict, colDict)


