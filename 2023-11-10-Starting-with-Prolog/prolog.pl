man(yash).
man(vishu).
man(utsav).
man(rachit).
woman(yashika).
woman(yashwini).
woman(vaishnavi).
woman(utsavi).
woman(rachna).
parent(yash,yashika).
parent(yash,yashwini).
parent(visnu,vaishnavi).
parent(utsav,utsavi).
parent(rachit,rachna).
parent(yash,utsav).
father(X,Y) :- man(X),parent(X,Y).
mother(X,Y) :- woman(X),parent(X,Y).
grandfather(X,Y) :- man(X),parent(X,Z),parent(Z,Y).
grandmother(X,Y) :- woman(X),parent(X,Z),parent(Z,Y).
brother(X,Y) :- dif(X,Y),man(X),man(Y),parent(Z,X),parent(Z,Y).
sister(X,Y) :- dif(X,Y),woman(X),woman(Y),parent(Z,X),parent(Z,Y).   /* the implementation assumes that sharing a common parent makes them sisters hence step sisters and sisters are treated the same */
~              

/*	 sister(yashika,yashwini)  should return true
	 grandfather(yash,utsav) should return true
*/
