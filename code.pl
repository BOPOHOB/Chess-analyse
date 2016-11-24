write(A,B,C):-write(A),write(" "),write(B),write(" "),write(C).
write(A,B,C,D):-write(A,B,C),write(" "),write(D).
write(A,B,C,D,E):-write(A,B,C,D),write(" "),write(E).
write(A,B,C,D,E,F):-write(A,B,C,D,E),write(" "),write(F).
write(A,B,C,D,E,F,G):-write(A,B,C,D,E,F),write(" "),write(G).
sum([_],0).
sum([ H1 | [ H2 | T ] ] ,R):-
	sum([H2|T], D),
	Delta is abs(H1 - H2),
	(
%Если ход по гарризонтали
		(
			Delta < 8,
			R is D + Delta
		);
	%Если ход по вертикали
		(
			Temp is mod(Delta, 10),
			Temp = 0,
			R is D + Delta / 10
		);
	% иначе по диагонали на 11
		(
			Temp is mod(Delta, 11),
			Temp = 0,
			R is D + mod(Delta, 10)
		);
	% иначе считаем, что ход по диагонали на 9
		(
			Temp is mod(Delta, 9),
			Temp = 0,
			R is D + abs(mod(Delta, 10) - 10)
		)
	).

% если не вышли за край поля(ноль в младшем разряде числа - выход за
%	границу, 1 - A, 2 - B, ... 8 - H, 9 - тоже выход...)
onTheBoard(P) :-
	A is mod(P, 10),
	A \= 0,
	A \= 9,
	P > 10,
	P < 90.

% вычисление всех путей 1 за одинм. P - позиция, 5 - глубина...
% S - Solution, P - Position, V - Visited, D - Количество шагов короче, O - Orientation
way(P,D,[SH|ST],V,O):-
% шагнули на клетку влево
	NewPosition is P + O,
%%	write(NewPosition, O, D, V, "\n"),
	onTheBoard(NewPosition),
% и если это поле ещё не проходилось
	not(member(NewPosition, V)),
	(
% то просто заканчиваем движение
		(
			Temp is D,
%%			write("bottom test ", Temp, "\n"),
			Temp = 0,
%%			write("bottom"),
			SH = NewPosition,
			ST = []
%%			write(" riched! \n")
		)
		;
%  либо останавливаемся тут и изменяем направление
		(
			Temp is D,
			Temp > 0,
%%			write("go to the deep\n"),
			NewPosition = SH,
			way(NewPosition,D - 1,ST,[NewPosition|V])
		)
		;
% либо продолжаем идти: делаем шаг из текущего положения, на той же глубине, не добавляя ничего в слюшн,
% но в посищённые закидываем текущую вершину. И идём в том же направлении...
%%		write("enother step\n"),
		way(NewPosition, D, [SH|ST], [NewPosition|V], O)
	).
way(P,D,S,V):-
	% направления ладьи
	way(P, D, S, V, -1);
	way(P, D, S, V, 1);
	way(P, D, S, V, -10);
	way(P, D, S, V, 10);
	% направления слона...
	way(P, D, S, V, -11);
	way(P, D, S, V, 11);
	way(P, D, S, V, 9);
	way(P, D, S, V, -9).
way(P,D,[P|S]):-way(P,D - 1,S,[P]).

len([],[]).
len([SH|ST],[RH|RT]):-
	sum(SH,RH),
	len(ST,RT).

at([Value|_], 0, Value).
at([_|T], Index, Value):-I2 is Index - 1, at(T,I2, Value).

% idOf(list, value, id)
% true если на позиции id расположен элемент value 
idOf([H|_],H,0).
idOf([_|T],V,Id):-
	idOf(T, V, Cur),
	Id is Cur + 1.

longest(D, C, Sol):-
	findall(P,way(D,C,P),Solutions),len(Solutions,I),max_member(Max,I),idOf(I,Max,V),at(Solutions, V, Sol).write(A,B,C):-write(A),write(" "),write(B),write(" "),write(C).
write(A,B,C,D):-write(A,B,C),write(" "),write(D).
write(A,B,C,D,E):-write(A,B,C,D),write(" "),write(E).
write(A,B,C,D,E,F):-write(A,B,C,D,E),write(" "),write(F).
write(A,B,C,D,E,F,G):-write(A,B,C,D,E,F),write(" "),write(G).
sum([_],0).
sum([ H1 | [ H2 | T ] ] ,R):-
	sum([H2|T], D),
	Delta is abs(H1 - H2),
	(
%Если ход по гарризонтали
		(
			Delta < 8,
			R is D + Delta
		);
	%Если ход по вертикали
		(
			Temp is mod(Delta, 10),
			Temp = 0,
			R is D + Delta / 10
		);
	% иначе по диагонали на 11
		(
			Temp is mod(Delta, 11),
			Temp = 0,
			R is D + mod(Delta, 10)
		);
	% иначе считаем, что ход по диагонали на 9
		(
			Temp is mod(Delta, 9),
			Temp = 0,
			R is D + abs(mod(Delta, 10) - 10)
		)
	).

% если не вышли за край поля(ноль в младшем разряде числа - выход за
%	границу, 1 - A, 2 - B, ... 8 - H, 9 - тоже выход...)
onTheBoard(P) :-
	A is mod(P, 10),
	A \= 0,
	A \= 9,
	P > 10,
	P < 90.

% вычисление всех путей 1 за одинм. P - позиция, 5 - глубина...
% S - Solution, P - Position, V - Visited, D - Количество шагов короче, O - Orientation
way(P,D,[SH|ST],V,O):-
% шагнули на клетку влево
	NewPosition is P + O,
%%	write(NewPosition, O, D, V, "\n"),
	onTheBoard(NewPosition),
% и если это поле ещё не проходилось
	not(member(NewPosition, V)),
	(
% то просто заканчиваем движение
		(
			Temp is D,
%%			write("bottom test ", Temp, "\n"),
			Temp = 0,
%%			write("bottom"),
			SH = NewPosition,
			ST = []
%%			write(" riched! \n")
		)
		;
%  либо останавливаемся тут и изменяем направление
		(
			Temp is D,
			Temp > 0,
%%			write("go to the deep\n"),
			NewPosition = SH,
			way(NewPosition,D - 1,ST,[NewPosition|V])
		)
		;
% либо продолжаем идти: делаем шаг из текущего положения, на той же глубине, не добавляя ничего в слюшн,
% но в посищённые закидываем текущую вершину. И идём в том же направлении...
%%		write("enother step\n"),
		way(NewPosition, D, [SH|ST], [NewPosition|V], O)
	).
way(P,D,S,V):-
	% направления ладьи
	way(P, D, S, V, -1);
	way(P, D, S, V, 1);
	way(P, D, S, V, -10);
	way(P, D, S, V, 10);
	% направления слона...
	way(P, D, S, V, -11);
	way(P, D, S, V, 11);
	way(P, D, S, V, 9);
	way(P, D, S, V, -9).
way(P,D,[P|S]):-way(P,D - 1,S,[P]).

len([],[]).
len([SH|ST],[RH|RT]):-
	sum(SH,RH),
	len(ST,RT).

at([Value|_], 0, Value).
at([_|T], Index, Value):-I2 is Index - 1, at(T,I2, Value).

% idOf(list, value, id)
% true если на позиции id расположен элемент value 
idOf([H|_],H,0).
idOf([_|T],V,Id):-
	idOf(T, V, Cur),
	Id is Cur + 1.

longest(D, C, Sol):-
	findall(P,way(D,C,P),Solutions),len(Solutions,I),max_member(Max,I),idOf(I,Max,V),at(Solutions, V, Sol).