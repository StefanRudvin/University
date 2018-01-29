Query processing reasoning statistic: Nominals
Query processing reasoning statistic: Standard
Required check done in 0.12 seconds
of which:
Preproc. takes 0.05 seconds
Consist. takes 0 seconds
Reasoning NOM:
     SAT takes 0 seconds
     SUB takes 0 seconds
Reasoning STD:
     SAT takes 0 seconds
     SUB takes 0 seconds
The rest takes 0.07 seconds
Heap size = 71 nodes
There were 30 cache hits
Object Roles (6):
Role "http://www.cs4021/bookstore.owl#hasAuthor"(1)
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasAuthor" -> 1
Role "-http://www.cs4021/bookstore.owl#hasAuthor"(-1) = "http://www.cs4021/bookstoreTest1.owl#hasWritten"
Role "http://www.cs4021/bookstore.owl#hasBook"(2)
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasBook" -> 1
Role "-http://www.cs4021/bookstore.owl#hasBook"(-2)
Automaton:
0 -- "-http://www.cs4021/bookstore.owl#hasBook" -> 1
Role "http://www.cs4021/bookstore.owl#hasBuyer"(3)
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasBuyer" -> 1
Role "-http://www.cs4021/bookstore.owl#hasBuyer"(-3) = "http://www.cs4021/bookstoreTest1.owl#hasMadePurchase"
Role "http://www.cs4021/bookstore.owl#hasSubject"(4)
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasSubject" -> 1
Role "-http://www.cs4021/bookstore.owl#hasSubject"(-4)
Automaton:
0 -- "-http://www.cs4021/bookstore.owl#hasSubject" -> 1
Role "http://www.cs4021/bookstoreTest1.owl#hasMadePurchase"(5)
Automaton:
0 -- "http://www.cs4021/bookstoreTest1.owl#hasMadePurchase" -> 1
Role "-http://www.cs4021/bookstoreTest1.owl#hasMadePurchase"(-5) = "http://www.cs4021/bookstore.owl#hasBuyer"
Role "http://www.cs4021/bookstoreTest1.owl#hasWritten"(6)
Automaton:
0 -- "http://www.cs4021/bookstoreTest1.owl#hasWritten" -> 1
Role "-http://www.cs4021/bookstoreTest1.owl#hasWritten"(-6) = "http://www.cs4021/bookstore.owl#hasAuthor"
Data Roles (3):
Role "http://www.cs4021/bookstore.owl#hasName"(1)tFD
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasName" -> 1
Role "-http://www.cs4021/bookstore.owl#hasName"(-1)
Automaton:
0 -- "-http://www.cs4021/bookstore.owl#hasName" -> 1
Role "http://www.cs4021/bookstore.owl#hasTitle"(2)tFD
Automaton:
0 -- "http://www.cs4021/bookstore.owl#hasTitle" -> 1
Role "-http://www.cs4021/bookstore.owl#hasTitle"(-2)
Automaton:
0 -- "-http://www.cs4021/bookstore.owl#hasTitle" -> 1
Role "http://www.cs4021/bookstore.owl#subjectName"(3)tFD
Automaton:
0 -- "http://www.cs4021/bookstore.owl#subjectName" -> 1
Role "-http://www.cs4021/bookstore.owl#subjectName"(-3)
Automaton:
0 -- "-http://www.cs4021/bookstore.owl#subjectName" -> 1
Concepts (16):
T.http://www.cs4021/bookstore.owl#Alien [5] [= http://www.cs4021/bookstore.owl#SciFi
T.http://www.cs4021/bookstore.owl#SciFi [4] [= http://www.cs4021/bookstore.owl#Fiction
T.http://www.cs4021/bookstore.owl#Book [2] [= *TOP*
T.http://www.cs4021/bookstore.owl#BookSubject [2] [= *TOP*
T.http://www.cs4021/bookstore.owl#Cyberpunk [5] [= http://www.cs4021/bookstore.owl#SciFi
T.http://www.cs4021/bookstore.owl#Fantasy [4] [= http://www.cs4021/bookstore.owl#Fiction
T.http://www.cs4021/bookstore.owl#Fiction [3] [= http://www.cs4021/bookstore.owl#BookSubject
T.http://www.cs4021/bookstore.owl#Fishing [4] [= http://www.cs4021/bookstore.owl#nonFiction
T.http://www.cs4021/bookstore.owl#nonFiction [3] [= http://www.cs4021/bookstore.owl#BookSubject
T.http://www.cs4021/bookstore.owl#Ocean_fishing [5] [= http://www.cs4021/bookstore.owl#Fishing
T.http://www.cs4021/bookstore.owl#Popular_science [5] [= http://www.cs4021/bookstore.owl#Science
T.http://www.cs4021/bookstore.owl#Science [4] [= http://www.cs4021/bookstore.owl#nonFiction
T.http://www.cs4021/bookstore.owl#Purchase [2] [= *TOP*
T.http://www.cs4021/bookstore.owl#River_fishing [5] [= http://www.cs4021/bookstore.owl#Fishing
T.http://www.cs4021/bookstore.owl#Scientific_literature [5] [= http://www.cs4021/bookstore.owl#Science
T.http://www.cs4021/bookstore.owl#Space_drama [5] [= http://www.cs4021/bookstore.owl#SciFi
Individuals (31):
r.!http://www.cs4021/bookstore.owl#alien [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Alien)
r.!http://www.cs4021/bookstore.owl#fishing [5] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Fishing)
r.!http://www.cs4021/bookstore.owl#Twin_Tower [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#fantasy [5] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Fantasy)
r.!http://www.cs4021/bookstore.owl#fiction [4] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Fiction)
r.!http://www.cs4021/bookstore.owl#riverfishing [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#River_fishing)
r.!http://www.cs4021/bookstore.owl#Purchase_6 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Fly_Fishing [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#cyberpunk [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Cyberpunk)
r.!http://www.cs4021/bookstore.owl#Purchase_5 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Moby_Dick [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#Purchase_4 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#popularscience [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Popular_science)
r.!http://www.cs4021/bookstore.owl#A_Brief_History_of_Time [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#science [5] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Science)
r.!http://www.cs4021/bookstore.owl#the_Hobbit [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#oceanfishing [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Ocean_fishing)
r.!http://www.cs4021/bookstore.owl#Purchase_1 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Purchase_38 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Dune [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#scifi [5] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#SciFi)
r.!http://www.cs4021/bookstore.owl#spacedrama [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Space_drama)
r.!http://www.cs4021/bookstore.owl#Purchase_17 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Purchase_39 [3] [= http://www.cs4021/bookstore.owl#Purchase
r.!http://www.cs4021/bookstore.owl#Fellow_of_the_Ring [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#nonfiction [4] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#nonFiction)
T.!http://www.cs4021/bookstore.owl#subject [3] [= http://www.cs4021/bookstore.owl#BookSubject
r.!http://www.cs4021/bookstore.owl#Dune2 [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#The_Emperors_New_Mind [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#Return_of_the_King [3] [= (and (not (all http://www.cs4021/bookstore.owl#hasTitle (not ))) http://www.cs4021/bookstore.owl#Book)
r.!http://www.cs4021/bookstore.owl#scientific_literature [6] [= (and (not (all http://www.cs4021/bookstore.owl#subjectName (not ))) http://www.cs4021/bookstore.owl#Scientific_literature)

Dag structure
1 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] *TOP*
2 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Alien) [= 3
3 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#SciFi) [= 4
4 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Fiction) [= 5
5 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#BookSubject) [= 1
6 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Book) [= 1
7 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Cyberpunk) [= 3
8 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Fantasy) [= 4
9 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Fishing) [= 10
10 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#nonFiction) [= 5
11 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Ocean_fishing) [= 9
12 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Popular_science) [= 13
13 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Science) [= 10
14 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Purchase) [= 1
15 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#River_fishing) [= 9
16 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Scientific_literature) [= 13
17 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] primconcept(http://www.cs4021/bookstore.owl#Space_drama) [= 3
18 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#alien) [= 22
19 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] data-type(string) [= 1
20 [d(0/0),s(0/1),b(0/0),g(0/0),f(0/0)] data-value() [= 19
21 [d(1/0),s(2/0),b(0/0),g(0/0),f(0/0)] all http://www.cs4021/bookstore.owl#subjectName{0} -20
22 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 2
23 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#fishing) [= 24
24 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 9
25 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Twin_Tower) [= 27
26 [d(1/0),s(2/0),b(0/0),g(0/0),f(0/0)] all http://www.cs4021/bookstore.owl#hasTitle{0} -20
27 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -26 6
28 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#fantasy) [= 29
29 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 8
30 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#fiction) [= 31
31 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 4
32 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#riverfishing) [= 33
33 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 15
34 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_6) [= 14
35 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Fly_Fishing) [= 27
36 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#cyberpunk) [= 37
37 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 7
38 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_5) [= 14
39 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Moby_Dick) [= 27
40 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_4) [= 14
41 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#popularscience) [= 42
42 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 12
43 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#A_Brief_History_of_Time) [= 27
44 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#science) [= 45
45 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 13
46 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#the_Hobbit) [= 27
47 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#oceanfishing) [= 48
48 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 11
49 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_1) [= 14
50 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_38) [= 14
51 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Dune) [= 27
52 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#scifi) [= 53
53 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 3
54 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#spacedrama) [= 55
55 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 17
56 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_17) [= 14
57 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Purchase_39) [= 14
58 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Fellow_of_the_Ring) [= 27
59 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#nonfiction) [= 60
60 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 10
61 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#subject) [= 5
62 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Dune2) [= 27
63 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#The_Emperors_New_Mind) [= 27
64 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#Return_of_the_King) [= 27
65 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] prim-singleton(http://www.cs4021/bookstore.owl#scientific_literature) [= 66
66 [d(0/1),s(0/4),b(0/1),g(0/0),f(0/0)] and -21 16
67 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] at-most 1 http://www.cs4021/bookstore.owl#hasName 1
68 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] at-most 1 http://www.cs4021/bookstore.owl#hasTitle 1
69 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] at-most 1 http://www.cs4021/bookstore.owl#subjectName 1
70 [d(0/0),s(0/0),b(0/0),g(0/0),f(0/0)] primconcept( ) [= 1
