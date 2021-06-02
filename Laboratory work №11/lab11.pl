% запишем пару предикатов для работы с файлами
read_str(A):- get0(X), r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):- append(B,[X],B1), get0(X1), r_str(X1,A,B1).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

print_list([]).
print_list([Head|Tail]):-write(Head),print_list(Tail).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).


:- dynamic quest/3.

% ////////////////////////////////////////////////////////////////////////////////
% 1) Является ли данный объект фильмом (не сериал)? 1 - да, 0 - нет.
quest(1,interstellar, 1).
quest(1,rick_and_morty, 0).
quest(1,the_green_mile, 1).
quest(1,green_book, 1).
quest(1,gravity_falls, 0).

quest(1,winx_club, 0).
quest(1,chappie, 1).
quest(1,i_robot, 1).
quest(1,harry_potter, 1).
quest(1,lord_of_rings, 1).

quest(1,simpsons, 0).
quest(1,south_park, 0).
quest(1,big_bang_theory, 0).
quest(1,riverdale, 0).
quest(1,teen_wolf, 0).

quest(1,fiksiki, 0).
quest(1,brilliant_hand, 1).
quest(1,three_bogatyrs, 1).
quest(1,chernobyl, 0).
quest(1,fathers_daughters, 0).

quest(1,ivan_and_wolf, 1).
quest(1,policeman_from_rublevka, 0).
quest(1,kadetstvo, 0).
quest(1,elki, 1).
quest(1,smeshariki, 0).

quest(1,barboskiny, 0).
quest(1,brat, 1).
quest(1,shawshank_redemption, 1). % "Побег из Шоушенка"
quest(1,inception, 1). % "Начало"
quest(1,departed, 1). % "Отступники"

% неизвестные дополнения к 1 вопросу
% quest(1,back_to_future, 1).
% quest(1,titanic, 1).
% quest(1,closed_school, 0).
% quest(1,friends, 0).
% quest(1,luntic, 0).

% quest(1,queens_gambit, 0).
% quest(1,boy_in_stripped_pijama, 1).
% quest(1,white_beam_black_ear, 1).
% quest(1,star_wars, 1).
% quest(1,masha_and_bear, 0).

% ////////////////////////////////////////////////////////////////////////////////
% 2) Является ли данный объект продуктом отечественного производства или
% нет? 1 - да, 0 - нет.
quest(2,interstellar, 0).
quest(2,rick_and_morty, 0).
quest(2,the_green_mile, 0).
quest(2,green_book, 0).
quest(2,gravity_falls, 0).

quest(2,winx_club, 0).
quest(2,chappie, 0).
quest(2,i_robot, 0).
quest(2,harry_potter, 0).
quest(2,lord_of_rings, 0).

quest(2,simpsons, 0).
quest(2,south_park, 0).
quest(2,big_bang_theory, 0).
quest(2,riverdale, 0).
quest(2,teen_wolf, 0).

quest(2,fiksiki, 1).
quest(2,brilliant_hand, 1).
quest(2,three_bogatyrs, 1).
quest(2,chernobyl, 1).
quest(2,fathers_daughters, 1).

quest(2,ivan_and_wolf, 1).
quest(2,policeman_from_rublevka, 1).
quest(2,kadetstvo, 1).
quest(2,elki, 1).
quest(2,smeshariki, 1).

quest(2,barboskiny, 1).
quest(2,brat, 1).
quest(2,shawshank_redemption, 0). % "Побег из Шоушенка"
quest(2,inception, 0). % "Начало"
quest(2,departed, 0). % "Отступники"

% неизвестные дополнения к 2 вопросу
% quest(2,back_to_future, 0).
% quest(2,titanic, 0).
% quest(2,closed_school, 1).
% quest(2,friends, 0).
% quest(2,luntic, 1).

% quest(2,queens_gambit, 0).
% quest(2,boy_in_stripped_pijama, 0).
% quest(2,white_beam_black_ear, 1).
% quest(2,star_wars, 0).
% quest(2,masha_and_bear, 1).

% ////////////////////////////////////////////////////////////////////////////////
% 3) Является ли данный объект мультипликацией или нет? 1 - да, 0 - нет.
quest(3,interstellar, 0).
quest(3,rick_and_morty, 1).
quest(3,the_green_mile, 0).
quest(3,green_book, 0).
quest(3,gravity_falls, 1).

quest(3,winx_club, 1).
quest(3,chappie, 0).
quest(3,i_robot, 0).
quest(3,harry_potter, 0).
quest(3,lord_of_rings, 0).

quest(3,simpsons, 1).
quest(3,south_park, 1).
quest(3,big_bang_theory, 0).
quest(3,riverdale, 0).
quest(3,teen_wolf, 0).

quest(3,fiksiki, 1).
quest(3,brilliant_hand, 0).
quest(3,three_bogatyrs, 1).
quest(3,chernobyl, 0).
quest(3,fathers_daughters, 0).

quest(3,ivan_and_wolf, 1).
quest(3,policeman_from_rublevka, 0).
quest(3,kadetstvo, 0).
quest(3,elki, 0).
quest(3,smeshariki, 1).

quest(3,barboskiny, 1).
quest(3,brat, 0).
quest(3,shawshank_redemption, 0). % "Побег из Шоушенка"
quest(3,inception, 0). % "Начало"
quest(3,departed, 0). % "Отступники"

% неизвестные дополнения к 3 вопросу
% quest(3,back_to_future, 0).
% quest(3,titanic, 0).
% quest(3,closed_school, 0).
% quest(3,friends, 0).
% quest(3,luntic, 1).

% quest(3,queens_gambit, 0).
% quest(3,boy_in_stripped_pijama, 0).
% quest(3,white_beam_black_ear, 0).
% quest(3,star_wars, 0).
% quest(3,masha_and_bear, 1).


% ////////////////////////////////////////////////////////////////////////////////
% 4) Многосерийный фильм? 2 - да, 1 - нет, 0 - это сериал, а не фильм.
quest(4,interstellar, 1).
quest(4,rick_and_morty, 0).
quest(4,the_green_mile, 1).
quest(4,green_book, 1).
quest(4,gravity_falls, 0).

quest(4,winx_club, 0).
quest(4,chappie, 1).
quest(4,i_robot, 1).
quest(4,harry_potter, 2).
quest(4,lord_of_rings, 2).

quest(4,simpsons, 0).
quest(4,south_park, 0).
quest(4,big_bang_theory, 0).
quest(4,riverdale, 0).
quest(4,teen_wolf, 0).

quest(4,fiksiki, 0).
quest(4,brilliant_hand, 1).
quest(4,three_bogatyrs, 2).
quest(4,chernobyl, 0).
quest(4,fathers_daughters, 0).

quest(4,ivan_and_wolf, 2).
quest(4,policeman_from_rublevka, 0).
quest(4,kadetstvo, 0).
quest(4,elki, 2).
quest(4,smeshariki, 0).

quest(4,barboskiny, 0).
quest(4,brat, 2).
quest(4,shawshank_redemption, 1). % "Побег из Шоушенка"
quest(4,inception, 1). % "Начало"
quest(4,departed, 1). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(4,back_to_future, 2).
% quest(4,titanic, 1).
% quest(4,closed_school, 0).
% quest(4,friends, 0).
% quest(4,luntic, 0).

% quest(4,queens_gambit, 0).
% quest(4,boy_in_stripped_pijama, 1).
% quest(4,white_beam_black_ear, 1).
% quest(4,star_wars, 2).
% quest(4,masha_and_bear, 0).



% ////////////////////////////////////////////////////////////////////////////////
% 5) Для детей?? 2 - точно да (малыши даже поймут), 1 - не совсем
% (могут смотреть и взрослые дети), 0 - СОВСЕМ НЕ ДЕТСКИЙ фильм.
quest(5,interstellar, 0).
quest(5,rick_and_morty, 0).
quest(5,the_green_mile, 0).
quest(5,green_book, 0).
quest(5,gravity_falls, 1).

quest(5,winx_club, 1).
quest(5,chappie, 0).
quest(5,i_robot, 0).
quest(5,harry_potter, 1).
quest(5,lord_of_rings, 0).

quest(5,simpsons, 0).
quest(5,south_park, 0).
quest(5,big_bang_theory, 0).
quest(5,riverdale, 0).
quest(5,teen_wolf, 0).

quest(5,fiksiki, 2).
quest(5,brilliant_hand, 0).
quest(5,three_bogatyrs, 2).
quest(5,chernobyl, 0).
quest(5,fathers_daughters, 1).

quest(5,ivan_and_wolf, 2).
quest(5,policeman_from_rublevka, 0).
quest(5,kadetstvo, 0).
quest(5,elki, 1).
quest(5,smeshariki, 2).

quest(5,barboskiny, 2).
quest(5,brat, 0).
quest(5,shawshank_redemption, 0). % "Побег из Шоушенка"
quest(5,inception, 0). % "Начало"
quest(5,departed, 0). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(5,back_to_future, 0).
% quest(5,titanic, 0).
% quest(5,closed_school, 0).
% quest(5,friends, 0).
% quest(5,luntic, 2).

% quest(5,queens_gambit, 0).
% quest(5,boy_in_stripped_pijama, 0).
% quest(5,white_beam_black_ear, 1).
% quest(5,star_wars, 0).
% quest(5,masha_and_bear, 2).


% ////////////////////////////////////////////////////////////////////////////////
% 6) Кто главный герой этой картины? 4 - человек, 3 - животное, 2 -
% человек и животное, 1 - робот, 0 - неопределено.
quest(6,interstellar, 4).
quest(6,rick_and_morty, 4).
quest(6,the_green_mile, 4).
quest(6,green_book, 4).
quest(6,gravity_falls, 4).

quest(6,winx_club, 0).
quest(6,chappie, 1).
quest(6,i_robot, 1).
quest(6,harry_potter, 4).
quest(6,lord_of_rings, 0).

quest(6,simpsons, 0).
quest(6,south_park, 4).
quest(6,big_bang_theory, 4).
quest(6,riverdale, 4).
quest(6,teen_wolf, 0).

quest(6,fiksiki, 0).
quest(6,brilliant_hand, 4).
quest(6,three_bogatyrs, 4).
quest(6,chernobyl, 4).
quest(6,fathers_daughters, 4).

quest(6,ivan_and_wolf, 2).
quest(6,policeman_from_rublevka, 4).
quest(6,kadetstvo, 4).
quest(6,elki, 4).
quest(6,smeshariki, 3).

quest(6,barboskiny, 3).
quest(6,brat, 4).
quest(6,shawshank_redemption, 4). % "Побег из Шоушенка"
quest(6,inception, 4). % "Начало"
quest(6,departed, 4). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(6,back_to_future, 4).
% quest(6,titanic, 4).
% quest(6,closed_school, 4).
% quest(6,friends, 4).
% quest(6,luntic, 0).

% quest(6,queens_gambit, 4).
% quest(6,boy_in_stripped_pijama, 4).
% quest(6,white_beam_black_ear, 2).
% quest(6,star_wars, 0).
% quest(6,masha_and_bear, 2).



% ////////////////////////////////////////////////////////////////////////////////
% 7) Какой жанр у фильма? 4 - фантастика, 3 - комедия, 2 - драма, 1 - криминал, 0 - что-то другое
quest(7,interstellar, 4).
quest(7,rick_and_morty, 4).
quest(7,the_green_mile, 2).
quest(7,green_book, 2).
quest(7,gravity_falls, 4).

quest(7,winx_club, 0).
quest(7,chappie, 4).
quest(7,i_robot, 4).
quest(7,harry_potter, 4).
quest(7,lord_of_rings, 4).

quest(7,simpsons, 3).
quest(7,south_park, 3).
quest(7,big_bang_theory, 3).
quest(7,riverdale, 1).
quest(7,teen_wolf, 4).

quest(7,fiksiki, 0).
quest(7,brilliant_hand, 3).
quest(7,three_bogatyrs, 0).
quest(7,chernobyl, 4).
quest(7,fathers_daughters, 3).

quest(7,ivan_and_wolf, 0).
quest(7,policeman_from_rublevka, 3).
quest(7,kadetstvo, 3).
quest(7,elki, 3).
quest(7,smeshariki, 0).

quest(7,barboskiny, 0).
quest(7,brat, 2).
quest(7,shawshank_redemption, 2). % "Побег из Шоушенка"
quest(7,inception, 4). % "Начало"
quest(7,departed, 1). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(7,back_to_future, 4).
% quest(7,titanic, 2).
% quest(7,closed_school, 4).
% quest(7,friends, 3).
% quest(7,luntic, 0).

% quest(7,queens_gambit, 2).
% quest(7,boy_in_stripped_pijama, 2).
% quest(7,white_beam_black_ear, 2).
% quest(7,star_wars, 4).
% quest(7,masha_and_bear, 0).



% ////////////////////////////////////////////////////////////////////////////////
% 8) Где происходит действие фильма? 4 - Космос, 3 - США, 2 - Советский Союз\Россия, 1 - Германия, 0 - что-то другое
quest(8,interstellar, 4).
quest(8,rick_and_morty, 0).
quest(8,the_green_mile, 3).
quest(8,green_book, 3).
quest(8,gravity_falls, 0).

quest(8,winx_club, 0).
quest(8,chappie, 3).
quest(8,i_robot, 3).
quest(8,harry_potter, 0).
quest(8,lord_of_rings, 0).

quest(8,simpsons, 0).
quest(8,south_park, 3).
quest(8,big_bang_theory, 3).
quest(8,riverdale, 0).
quest(8,teen_wolf, 3).

quest(8,fiksiki, 0).
quest(8,brilliant_hand, 2).
quest(8,three_bogatyrs, 0).
quest(8,chernobyl, 2).
quest(8,fathers_daughters, 2).

quest(8,ivan_and_wolf, 0).
quest(8,policeman_from_rublevka, 2).
quest(8,kadetstvo, 2).
quest(8,elki, 2).
quest(8,smeshariki, 0).

quest(8,barboskiny, 0).
quest(8,brat, 2).
quest(8,shawshank_redemption, 3). % "Побег из Шоушенка"
quest(8,inception, 0). % "Начало"
quest(8,departed, 3). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(8,back_to_future, 0).
% quest(8,titanic, 0).
% quest(8,closed_school, 2).
% quest(8,friends, 3).
% quest(8,luntic, 0).

% quest(8,queens_gambit, 0).
% quest(8,boy_in_stripped_pijama, 1).
% quest(8,white_beam_black_ear, 2).
% quest(8,star_wars, 4).
% quest(8,masha_and_bear, 0).



% ////////////////////////////////////////////////////////////////////////////////
% 9) Дата производства? 2 - до 2000, 1 - 2000 - 2010, 0 - 2010 - сегодня,
quest(9,interstellar, 0).
quest(9,rick_and_morty, 0).
quest(9,the_green_mile, 2).
quest(9,green_book, 0).
quest(9,gravity_falls, 0).

quest(9,winx_club, 1).
quest(9,chappie, 0).
quest(9,i_robot, 1).
quest(9,harry_potter, 1).
quest(9,lord_of_rings, 1).

quest(9,simpsons, 2).
quest(9,south_park, 2).
quest(9,big_bang_theory, 1).
quest(9,riverdale, 0).
quest(9,teen_wolf, 0).

quest(9,fiksiki, 0).
quest(9,brilliant_hand, 2).
quest(9,three_bogatyrs, 1).
quest(9,chernobyl, 0).
quest(9,fathers_daughters, 1).

quest(9,ivan_and_wolf, 0).
quest(9,policeman_from_rublevka, 0).
quest(9,kadetstvo, 1).
quest(9,elki, 1).
quest(9,smeshariki, 1).

quest(9,barboskiny, 1).
quest(9,brat, 2).
quest(9,shawshank_redemption, 2). % "Побег из Шоушенка"
quest(9,inception, 1). % "Начало"
quest(9,departed, 1). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(9,back_to_future, 2).
% quest(9,titanic, 2).
% quest(9,closed_school, 0).
% quest(9,friends, 2).
% quest(9,luntic, 1).

% quest(9,queens_gambit, 0).
% quest(9,boy_in_stripped_pijama, 1).
% quest(9,operation_y, 2).
% quest(9,star_wars, 2).
% quest(9,masha_and_bear, 1).



% ////////////////////////////////////////////////////////////////////////////////
% 10) Играл ли этот актер в вашем фильме? 3 - Морган Фримен, 2 - Павел Прилучный, 1 - Копатыч, 0 - никто
quest(10,interstellar, 0).
quest(10,rick_and_morty, 0).
quest(10,the_green_mile, 0).
quest(10,green_book, 0).
quest(10,gravity_falls, 0).

quest(10,winx_club, 0).
quest(10,chappie, 0).
quest(10,i_robot, 0).
quest(10,harry_potter, 0).
quest(10,lord_of_rings, 0).

quest(10,simpsons, 0).
quest(10,south_park, 0).
quest(10,big_bang_theory, 0).
quest(10,riverdale, 0).
quest(10,teen_wolf, 0).

quest(10,fiksiki, 0).
quest(10,brilliant_hand, 0).
quest(10,three_bogatyrs, 0).
quest(10,chernobyl, 0).
quest(10,fathers_daughters, 0).

quest(10,ivan_and_wolf, 0).
quest(10,policeman_from_rublevka, 0).
quest(10,kadetstvo, 0).
quest(10,elki, 0).
quest(10,smeshariki, 1).

quest(10,barboskiny, 0).
quest(10,brat, 0).
quest(10,shawshank_redemption, 3). % "Побег из Шоушенка"
quest(10,inception, 0). % "Начало"
quest(10,departed, 0). % "Отступники"

% неизвестные дополнения к 4 вопросу
% quest(10,back_to_future, 0).
% quest(10,titanic, 0).
% quest(10,closed_school, 2).
% quest(10,friends, 0).
% quest(10,luntic, 0).

% quest(10,queens_gambit, 0).
% quest(10,boy_in_stripped_pijama, 0).
% quest(10,operation_y, 0).
% quest(10,star_wars, 0).
% quest(10,masha_and_bear, 0).



% ////////////////////////////////////////////////////////////////////////////////
% ВОПРОСЫ:
quest(1,X):-	nl, write("Is this film or serial?"),nl,
				write("1. Film"),nl,
				write("0. Serial"),nl,
				read(X).

quest(2,X):-	nl, write("Is that a foreign movie ?"),nl,
				write("1. Our *RUSSIA IS BEST!*"),nl,
				write("0. Foreign"),nl,
				read(X).

quest(3,X):-	nl, write("Is that movie a cartoon?"),nl,
				write("1. Cartoon"),nl,
				write("0. Not cartoon"),nl,
				read(X).

quest(4,X):-	nl, write("Is that a multi-part movie?"),nl,
				write("2. Yes, it is"),nl,
				write("1. No, it isn't"),nl,
                                write("0. It's a SERIAL WTF"),nl,
				read(X).

quest(5,X):-	nl, write("Is that a child movie?"),nl,
				write("2. Yes, it is *for little kids*"),nl,
				write("1. Not at all (for teenagers)"),nl,
                                write("0. It's a movie for ADULT!"),nl,
				read(X).

quest(6,X):-	nl, write("Who's a main actor?"),nl,
				write("4. Human"),nl,
				write("3. Animal"),nl,
                                write("2. Human & animal"),nl,
                                write("1. Robot"),nl,
                                write("0. Can't define"),nl,
				read(X).

quest(7,X):-	nl, write("Movie genre *janr kino*"),nl,
				write("4. Fantastic"),nl,
				write("3. Comedy"),nl,
                                write("2. Drama"),nl,
                                write("1. Criminal"),nl,
                                write("0. Smth other"),nl,
				read(X).

quest(8,X):-	nl, write("Where the action take place?"),nl,
				write("4. Space"),nl,
				write("3. USA"),nl,
                                write("2. Russia/USSR"),nl,
                                write("1. Germany"),nl,
                                write("0. Smth other"),nl,
				read(X).

quest(9,X):-	nl, write("When was the movie created?"),nl,
				write("2. Before 2000"),nl,
				write("1. 2000 - 2010"),nl,
                                write("0. 2010 - today"),nl,
				read(X).

quest(10,X):-	nl, write("Does this actor played in your movie?"),nl,
				write("3. Morgan Freeman"),nl,
				write("2. Pavel Priluchny"),nl,
                                write("1. Kopatych"),nl,
                                write("0. None of them"),nl,
				read(X).

p1:- (exists_file('F:/Films.txt') -> consult_file(L); true),
	quest(1,X1),quest(2,X2),quest(3,X3),quest(4,X4),quest(5,X5),
	quest(6,X6),quest(7,X7),quest(8,X8),quest(9,X9),quest(10,X10),
	(quest(1,X,X1),quest(2,X,X2),quest(3,X,X3),quest(4,X,X4),
	quest(5,X,X5),quest(6,X,X6),quest(7,X,X7),quest(8,X,X8),quest(9,X,X9), quest(10,X,X10) ->
	write(X);

	write("This film/serial isn't in the database."), nl,
	write("Do you want to add it?"), nl, write("1. Yes"), nl, write("2. No"), nl,
	read(M),
	(M = 1 -> write("Enter the film/serial name: "), read(Name),
	 asserta(quest(10,Name,X10)),
	asserta(quest(9,Name,X9)), asserta(quest(8,Name,X8)),
	asserta(quest(7,Name,X7)), asserta(quest(6,Name,X6)),
	asserta(quest(5,Name,X5)), asserta(quest(4,Name,X4)),
	asserta(quest(3,Name,X3)), asserta(quest(2,Name,X2)),
	asserta(quest(1,Name,X1)), write("The character was added."),
	retractall(quest(_,Name,_)),
	tell('F:/Films.txt'),
	nl, write("1."), nl, write(Name), nl, write(X1), write("."),
	nl, write("2."), nl, write(Name), nl, write(X2), write("."),
	nl, write("3."), nl, write(Name), nl, write(X3), write("."),
	nl, write("4."), nl, write(Name), nl, write(X4), write("."),
	nl, write("5."), nl, write(Name), nl, write(X5), write("."),
	nl, write("6."), nl, write(Name), nl, write(X6), write("."),
	nl, write("7."), nl, write(Name), nl, write(X7), write("."),
	nl, write("8."), nl, write(Name), nl, write(X8), write("."),
	nl, write("9."), nl, write(Name), nl, write(X9), write("."),
	nl, write("10."), nl, write(Name), nl, write(X10), write("."),
	(nonvar(L) -> write_list_str(L); true),
	told;
	true)).


consult_file(L):- see('F:/Films.txt'), get0(Sym),
	read_quest(Sym,L), seen.

read_quest(-1,[]):-!.
read_quest(_,[[NumQ,X,Y]|T]):- read(NumQ), get0(_), read_str(Name), name(X,Name), read(Y),
	asserta(quest(NumQ,X,Y)), get0(Sym), read_quest(Sym,T).
