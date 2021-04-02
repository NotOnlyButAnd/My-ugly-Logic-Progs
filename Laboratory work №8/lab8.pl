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

