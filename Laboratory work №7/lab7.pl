unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList),
	unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),
	r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).


reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

remove_from_list(List, Elem, Result) :-
	remove_from_list(List, Elem, [], Result).

remove_from_list([IH|IT], Elem, TempLeft, Result) :-
	IH = Elem,
	reverse(TempLeft, TempLeftReverse),

	append(TempLeftReverse, IT, Result), !.

remove_from_list([IH|IT], Elem, TempLeft, Result) :-
	not(IH = Elem),
	remove_from_list(IT, Elem, [IH|TempLeft], Result).

b_a_p_rep([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p_rep(A,Perm):-unique_elems(A, Aun), in_list_exlude(Aun,El,Aun1),remove_from_list(A, El, A1),b_a_p_rep(A1,[El|Perm]).

build_all_perm_rep(File) :-
	tell(File),
	read_str(A,N),
	not(b_a_p_rep(A,[])),
	told.

%task1
pr:-read_str(Str,N,0),nl,nl,write_str(Str),
	write(", "),write_str(Str)
	,write(", "),write_str(Str),
	nl,write(N).

% task2 - кол-во слов в строке
words([],WordNumber,_,WordNumber):-!.
words([H|T],WordNumber,Flag,CurWordNumber):-
	((H\=32, Flag=0) ->   %встретили 1 символ после пробела(нашли +1 слово)
            (CurWordNumber1 is CurWordNumber +1,
	     Flag1 is 1, words(T,WordNumber,Flag1,CurWordNumber1));
       ((H=32, Flag=0) ->     %встретили пробел когда идем по пробелам
	    words(T,WordNumber,Flag,CurWordNumber);
       ((H=32, Flag=1) ->     %нашли пробел когда идем по слову
            (Flag1 is 0,
	     words(T,WordNumber,Flag1,CurWordNumber));
        words(T,WordNumber,Flag,CurWordNumber)))).

task_2:-read_str(Str,_,0),words(Str,WordNumber,0,0), nl, write(WordNumber).

% task 3 - определить самое частое слово
% [слово,количество]
%get_all_words([],Words,Words,_,[]):-!.
get_all_words([],Words,Words,_,_):-!.
get_all_words([H|T],Words,CurWords,Flag,CurWord):-
	((H\=32, Flag=0) ->   %встретили 1 символ после пробела
            (append([CurWord],[H],CurWord1),
	     Flag1 is 1, get_all_words(T,Words,CurWords,Flag1,CurWord1));
       ((H=32, Flag=0) ->     %встретили пробел когда идем по пробелам
	    get_all_words(T,Words,CurWords,Flag,CurWord);
       ((H=32, Flag=1) ->     %нашли пробел когда идем по слову
            (Flag1 is 0, append([CurWords],[CurWord],CurWords1),
	     get_all_words(T,Words,CurWords1,Flag1,[]));
        (append([CurWord],[H],CurWord1),
	 get_all_words(T,Words,CurWords,Flag,CurWord1))))).

task_3:- read_str(Str,_,0),get_all_words(Str, Words,[],0,[]), nl, write(Str),
	nl, write(Words).

% task 4
write_last_3([H1,H2,H3],3):-
	write_str([H1]),nl,
	write_str([H2]),nl,
	write_str([H3]),nl,!.
write_last_3([_|T],N):- N1 is N - 1, write_last_3(T,N1).

write_first_last_3([H1,H2,H3|T],N):-
	write_str([H1]),nl,
	write_str([H2]),nl,
	write_str([H3]),nl,
	N1 is N - 3, write_last_3(T, N1).


write_str_n(_,N,N):-!.
write_str_n(Str, N, I):- write_str(Str),nl, I1 is I + 1, write_str_n(Str, N, I1).

write_first_n([H|_],N):- write_str_n([H],N,0).

task_4:- read_str(Str,N,0),
	(N > 5 -> write_first_last_3(Str,N); write_first_n(Str,N)).


% task5 - номера символов совпадающих с последним
get_last_el_str([T],T):-!.
get_last_el_str([_|T],El):- get_last_el_str(T,El1), El is El1.

write_num_same_last([],_,_):-!.
write_num_same_last([H|T],Last,I):-
	(H = Last -> (write(I), nl, I1 is I + 1); (I1 is I + 1)),
	write_num_same_last(T,Last,I1).

task_5:- read_str(Str,_,0),get_last_el_str(Str,Last),
	write_num_same_last(Str,Last,0).
