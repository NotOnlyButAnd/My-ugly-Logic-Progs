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

length_str([],0):-!.
length_str([_|T],N):-
    length_str(T,Nnew), N is Nnew+1.

max_length([],0):-!.
max_length([H|T],Max):-
    max_length(T,CurMax),
    length_str(H,N),
    ((N>CurMax) ->
        (Max is N);
        (Max is CurMax)).

read_write_file:-
    see('Z:/lab8_prolog/input.txt'), read_list_str(List), seen,
    tell('Z:/lab8_prolog/output.txt'), write_list_str(List),told.

task1_1:-
     see('Z:/lab8_prolog/task1_1.txt'),
     read_list_str(File), seen,
     max_length(File,Max),
     write(Max).

str_space([32|_]):-!.
str_space([32]):-!.
str_space([_|T]):-
    str_space(T).

count_str_with_spaces([],0):-!.
count_str_with_spaces([H|T],Count):-
    count_str_with_spaces(T,CountNew),
    (not(str_space(H)) ->
    (Count is CountNew + 1);
    (Count is CountNew)).

task1_2:-
    see('F:/task1_2.txt'),
    read_list_str(File), seen,
    count_str_with_spaces(File,Count),
    write(Count).

% A - 65
count_A_by_str([],CountA,CountA):-!.
count_A_by_str([H|T],CountA,CurCountA):-
	((H = 65) -> (CurCountA1 is CurCountA + 1); (CurCountA1 is CurCountA)),
	count_A_by_str(T,CountA,CurCountA1).

count_A_in_file([],CountA,CountA):-!.
count_A_in_file([HF|TF],CountA,CurCountA):-
	count_A_by_str(HF,CountAStr,0), CurCountA1 is CurCountA + CountAStr,
	count_A_in_file(TF,CountA,CurCountA1).

write_some_str_by_A([]):-!.
write_some_str_by_A([H|T],SrAByStr):-
	count_A_by_str(H,CountA,0),
	((CountA > SrAByStr) -> (write_str(H),nl); true),
	write_some_str_by_A(T,SrAByStr).

% aAbAbcda    (+)
% bsdfbsbdsd  (-)
% ababqwAofop (-)
% bAdfsAa     (+)
%
% A in file - 5
% Sr A by Str = 5 / 4 = 1.25
task1_3:-
    see('F:/task1_2.txt'),
    read_list_str(File), seen,
    count_A_in_file(File,CountAF,0),
    length_str(File,N),
    SrAByStr is CountAF / N,
    write(SrAByStr),nl,nl,
    write_some_str_by_A(File,SrAByStr).


% ЗАДАНИЕ 1.4
task1_4:-
	see('F:/task1_4.txt'),
	read_str(A,_,1),seen,
	append([32],A,A1),reverse(A1,AR),
	list_words(AR,[],LW,[]),
	often_word_in_list(LW,_,Word,0,_),write_str(Word).

list_words:-
	read_str(A,_,_),append([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-
	(H=32 -> append([W],LW,LW1),list_words(T,LW1,LWN,[]);
	append([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-write(Kol),nl, !.
kol_repeat_in_list([H|T],X,K,Kol):-
	(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);
	kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),
	(K1>K -> Kol1 = K1,W1=H,often_word_in_list(T,W1,Word,K1,Kol1);
	often_word_in_list(T,W,Word,K,Kol)).

% ЗАДАНИЕ 2.1 (4)
% ПАЛИНДРОМЫ (перевертыши) - слова, читающиеся одинаково в обоих направлениях.
%
% вызов : mirror([97,98,99],Itog,[_|[]]).
% т.к. голову кладем как бы в конец, т.е. должен быть пустой список в
% конце (по определению списков черча
%
% Палиндромы-строки:
% аргентина манит негра
% рвал дед лавр
% коту тащат уток
% Т.Е. надо еще удалить пробелы перед проверкой строк на палиндромность
%
% небольшой костыль, в конце после добавления послденего символа
% добавляется неинициализированная переменная. поэтому в конце ее
% отрубаем и только потом кладём в итог
mirror([],T,[_|T]):-!.
mirror([H|T],Itog,[H1|T1]):-H1 is H, mirror(T,Itog,[_|[H1|T1]]).

% CurItog инициализируй []
del_all_spaces_str([],Itog, Itog):-!.
del_all_spaces_str([H|T], CurItog, Itog):-
	(H \= 32 -> append(CurItog,[H], CurItog1) ;
	append(CurItog, [], CurItog1)),
	del_all_spaces_str(T,CurItog1,Itog).

% В ФАЙЛ ПИСАТЬ ТОЛЬКО 1 СТРОКУ
task2_1_4:-
    see('F:/task2_1_4.txt'),
    read_list_str([H|_]), seen,
    write_str(H), nl,
    del_all_spaces_str(H,[],StrWOutSpaces),
    mirror(StrWOutSpaces, Itog,[_|[]]),
    %Вывод строчек чтобы посмотреть как он их преобразовал
    %write_str(StrWOutSpaces), nl,
    %write_str(Itog), nl,
    (StrWOutSpaces = Itog -> write("Палиндром)))"); write("НЕ палиндром(((")).
