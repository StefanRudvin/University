store(007,"How to milk a movie series").
store(123456, "Counting for dummies").
store(654321, "How to count downwards").
store(911, "This is an emergency").
store(2017,"The beginning of trumps reign").
store(2018,"It's not as bad as we thought. I'ts worse").
store(2019,"How to climb a wall").
store(2019,"How to install a telescreen").
store(2021,"1984 is the best").

querycustomerbooknumber(N,Num) :-
    findall(1,store(N,_),A),
	length(A,Num).

querybooksold(Q, Num) :-
	findall(1,store(_,Q),O),
	length(O,Num).