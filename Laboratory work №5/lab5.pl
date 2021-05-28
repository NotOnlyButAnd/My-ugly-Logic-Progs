
sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list1([El|_],El):-!.
in_list1([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

% задание 1.
% формируем список из 5 эл-тов (пофиг каких)
% каждый из них соотв-ет 1 дому
% каждый из них - список из 5 эл-тов
% 1 - цвет
% 2 - национальность
% 3 - напиток
% 4 - животные
% 5 - сигареты
% Смотрим на условие, запихиваем все условия в списки
pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),
		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		nl, write(WHO1),nl,write(WHO2).

pr_corona:- Corona=[_,_,_,_],

            in_list(Corona,[_,italy,_,pohoroni]),
            in_list(Corona,[_,france,_,svadba]),
            in_list(Corona,[_,america,1,_]),
            in_list(Corona,[progger,_,_,conf]),
            in_list(Corona,[chinusha,_,45,_]),
            in_list(Corona,[_,kitai,_,otdih]),
            in_list(Corona,[_,france,15,_]),
            in_list(Corona,[bankir,_,6,_]),

            (   in_list(Corona,[blogger,italy,_,_]);
                in_list(Corona,[blogger,france,_,_]);
                 in_list(Corona,[blogger,america,_,_])),

            (   in_list(Corona,[chinusha,italy,_,_]);
                in_list(Corona,[chinusha,france,_,_]);
                 in_list(Corona,[chinusha,america,_,_])),

            write(Corona).


write_place_people(A,B):-write(A),write(": "),
    in_list(B,[A,WORK1,PLACE1,NUMB1]),write(WORK1),write(", "),
    write(PLACE1),write(", "),write(NUMB1),nl,!.

% �������� ���������, ������ ��� ������ � ������ ������ ������������ ��
% ������ �������, �� �������� � ���� ������� ���� � �� ��;
pr_log:-Seek=[_,_,_,_],
    in_list(Seek,[_,funeral,lake_Koma,_]),
    in_list(Seek,[_,marry,nicca,_]),
    in_list(Seek,[_,_,california,1]),
    in_list(Seek,[programmer,conference,_,_]),
    in_list(Seek,[_,rest,china,_]),
    (in_list(Seek,[programmer,_,china,_]);in_list(Seek,[banker,_,china,_])),
    in_list(Seek,[official,_,_,45]),
    in_list(Seek,[_,_,nicca,15]),
    in_list(Seek,[banker,_,_,6]),
    in_list(Seek,[bloger,_,_,_]),

    write(Seek),nl,nl,
    write_place_people(programmer,Seek),
    write_place_people(banker,Seek),
    write_place_people(bloger,Seek),
    write_place_people(official,Seek).


pr_ein1:-Event=[_,_,_,_],
    in_list(Event,[funeral,italy,_,_]),
    in_list(Event,[wedding,france,_,_]),
    in_list(Event,[_,france,_,15]),
    in_list(Event,[rest,china,_,_]),
    in_list(Event,[conference,_,programmer,_]),
    in_list(Event,[_,usa,_,1]),
    in_list(Event,[_,_,official,45]),
    in_list(Event,[_,_,banker,6]),
    in_list(Event,[_,_,blogger,_]),
    not(in_list(Event,[_,china,blogger,_])),
    not(in_list(Event,[_,china,official,_])),

    in_list(Event,[funeral,F1,F2,F3]),
    in_list(Event,[wedding,S1,S2,S3]),
    in_list(Event,[rest,T1,T2,T3]),
    in_list(Event,[conference,Frth1,Frth2,Frth3]),

    write("funeral "),write(F1),write(" "),write(F2),write(" "),write(F3),nl,
    write("wedding "),write(S1),write(" "),write(S2),write(" "),write(S3),nl,
    write("rest "),write(T1),write(" "),write(T2),write(" "),write(T3),nl,
    write("conference "),write(Frth1),write(" "),write(Frth2),write(" "),
    write(Frth3).

% ЗАДАНИЕ 2
% Men[фамилия,цвет_волос]

% get_last_el([H|[]],H):-!.
% get_last_el([_|T],El):- get_last_el(T,El1), El is El1.

%task_2:- Men = [[_|rizhy],[_|blondin],[_|brynet]],
%    (in_list(Men,[belokurov,rizhiy]));
%    (in_list(Men,[belokurov,brynet])),
%    (in_list(Men,[rizhov,blondin]));
%    (in_list(Men,[rizhov,brynet])),
%    (in_list(Men,[chernov,blondin]));
%    (in_list(Men,[chernov,rizhiy])),
%    write(Men).

task_2:- Men = [[_,rizhy],[_,blondin],[_,brynet]],
    in_list(Men,[belokurov,_]),
    in_list(Men,[rizhov,_]),
    in_list(Men,[chernov,_]),
    not(in_list(Men,[belokurov,blondin])),
    not(in_list(Men,[rizhov,rizhy])),
    not(in_list(Men,[chernov,brynet])),
    write(Men).

% ЗАДАНИЕ 3
% [имя,цвет_платья,цвет_туфель]
task_3:- Girls = [[anya,_,_],[natasha,_,_],[valya,_,_]],
    in_list(Girls,[_,white,_]),
    in_list(Girls,[_,green,_]),
    in_list(Girls,[_,blue,_]),
    in_list(Girls,[_,_,white]),
    in_list(Girls,[_,_,green]),
    in_list(Girls,[_,_,blue]),

    in_list(Girls,[natasha,_,green]),   %Наташа была в зеленых туфлях

    in_list(Girls,[anya,T1,T1]),          %Только у Ани
    not(in_list(Girls,[natasha,T2,T2])),  %платье и туфли
    not(in_list(Girls,[valya,T3,T3])),    %одинакового цвета

    not(in_list(Girls,[valya,white,_])),   %Ни туфли ни платье
    not(in_list(Girls,[valya,_,white])),   %Вали не белые

    write(Girls).


% ЗАДАНИЕ 4
% [профессия,фамилия,братья_сестры,возраст]
% братья_сестры: 0 - нету, 1 - есть
% возраст: 1 - самый старший, 2 - средний, 3 - самый младший
task_4:- Guys = [[slesar,_,_,_],[tokar,_,_,_],[svarshik,_,_,_]],
    in_list(Guys,[_,borisov,_,_]),
    in_list(Guys,[_,semenov,_,_]),
    in_list(Guys,[_,ivanov,_,_]),

    in_list(Guys,[slesar,Slesar,0,3]), % у слесаря ни братьев ни сестер + младший
    in_list(Guys,[_,borisov,1,_]),% ... женатый на сестре Борисова
    in_list(Guys,[_,semenov,_,1]),% Семёнов ...
    in_list(Guys,[tokar,Tokar,_,2]),  % ... старше токаря
    in_list(Guys,[svarshik,Svarshik,_,_]), % находим фамилию сварщика

    write('slesar - '), write(Slesar), nl,
    write('tokar - '), write(Tokar), nl,
    write('svarshik - '), write(Svarshik).

% находится ли сосуд B между A и C в Dishes (причем подряд идут они)
is_between_next(A,B,C,Dishes):- (sprava_next(A,B,Dishes), sleva_next(C,B,Dishes));
                                (sprava_next(C,B,Dishes), sleva_next(A,B,Dishes)).

%ЗАДАНИЕ 5
% [посуда,жидкость]
task_5_v2:- Dishes = [_,_,_,_],
    % делаем перебор по всем вариантам
    in_list(Dishes, [bottle,_]),
    in_list(Dishes, [stakan,_]),
    in_list(Dishes, [kuvshin,_]),
    in_list(Dishes, [banka,_]),

    in_list(Dishes, [_, milk]),
    in_list(Dishes, [_, limonad]),
    in_list(Dishes, [_, kvas]),
    in_list(Dishes, [_, water]),

    % вода и молоко не в бутылке
    not(in_list(Dishes,[bottle, water])),
    not(in_list(Dishes,[bottle, milk])),

    % сосуд с лимонадом находится между кувшином  и сосудом с квасом
    is_between_next([_, kvas], [_, limonad], [kuvshin, _], Dishes),

    % в банке не лимонад и не вода
    not(in_list(Dishes,[banka, limonad])),
    not(in_list(Dishes,[banka, water])),

    % стакан около банки и сосуда с молоком
    next_to([stakan, _],[_, milk],Dishes),
    next_to([stakan, _],[banka, _],Dishes),

   write(Dishes).

% правильный ответ:
% [[banka,milk],[stakan,kvas],[bottle,limonad],[kuvshin,water]]
% но их по факту 2 и они оба верные, проверено)))


% ЗАДАНИЕ 6
% [фамилия, занятие]
task_6:-People=[_,_,_,_],
    in_list(People,[_,dancer]),
    in_list(People,[_,artist]),
    in_list(People,[_,singer]),
    in_list(People,[_,writer]),

    in_list(People,[voronov,_]),
    in_list(People,[pavlov,_]),
    in_list(People,[levickiy,_]),
    in_list(People,[sakharov,_]),

    not(in_list(People,[voronov,singer])),
    not(in_list(People,[levickiy,singer])),

    not(in_list(People,[pavlov,artist])),
    not(in_list(People,[pavlov,writer])),

    not(in_list(People,[sakharov,writer])),
    not(in_list(People,[voronov,writer])),
   % точно определено что трое человек - сахаров воронов и павлов - не писатели =>
   % левицкий - писатель. А так как он позировал художнику, то воронов точно не художник
   % (раз он его не знает)
   not(in_list(People,[voronov,artist])),

   % отключаем перебор так как выводит просто варианты одних и тех же занятий,
   % только в разном порядке а нам ита ни нада
    write(People), !.


% ЗАДАНИЕ 7
task_7:-Sport=[_,_,_],

    in_list(Sport,[maikl,_,basketball,_]),
    in_list(Sport,[saimon,izrail,_,_]),
    in_list(Sport,[richard,_,_,_]),
    in_list(Sport,[_,australia,_,_]),
    in_list(Sport,[_,_,criket,1]),

    % делаем оставшийся перебор
    in_list(Sport,[_,america,_,_]),
    in_list(Sport,[_,_,tennis,_]),
    in_list(Sport,[_,_,_,2]),
    in_list(Sport,[_,_,_,3]),

    % распределяем кто лучше кого играет
    in_list(Sport,[maikl,_,_,N1]),
    in_list(Sport,[_,america,_,N2]),N1<N2,
    in_list(Sport,[saimon,_,_,N3]),
    in_list(Sport,[_,_,tennis,N4]),N3<N4,

    not(in_list(Sport,[saimon,_,tennis,_])),
    not(in_list(Sport,[maikl,america,_,_])),

    in_list(Sport,[Australian,australia,_,_]),
    write("Australian - "), write(Australian),nl,

    in_list(Sport,[richard,_,RichardP,_]),
    write("Richard plays "), write(RichardP),nl,
    % опять обрубаем перебор так как порядок нас не интересует
    write(Sport),!.


% ЗАДАНИЕ 8
% Вариант 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (Андрей, Дмитрий, Борис, Виктор, Григорий)

st_A(A):-A=andre; A=net.   % есть\нет Андрея
st_D(D):-D=dmitri; D=net.  % есть\нет Дмитрия
st_B(B):-B=boris; B=net.   % есть\нет Бориса
st_V(V):-V=victor; V=net.  % есть\нет Виктора
st_G(G):-G=grig; G=net.    % есть\нет Григорий

ogr1(andre,_,_,net,_).   % 2. Если Виктор пришел, то Андрея быть
ogr1(net,_,_,victor,_).  % не должно (и наоборот)

ogr2(_,dmitri,_,_,net).  % 3. Если Дмитрий пришёл, то
ogr2(_,net,_,_,_).       % Григория быть не должно

norm1(andre,dmitri,net,_,_).   % 1. Если пришли Андрей и Дмитрий, то Бориса быть не должно...
norm2(andre,net,boris,net,_).  % 1. ...но если Дмитрий не пришел, то Борис должен быть, а Виктор быть не должен

norm3(_,dmitri,net,net,_).     % 4. Если бориса нет,то Дмитрий должен быть, но при условии что нет также и Виктора...
norm4(_,net,net,victor,grig).  % 4. ... но если Виктор есть, то Дмитрия быть не должно, но должен быть григорий

% n1&n2, n1&n4, n2&n3, n2&n4, n3&n4 - взаимоискл;
% n1&n3, n1, n3 - выводят одинаковые варианты распределения ребят
spisok(A,D,B,V,G):-
    % перебираем возможные варианты комбинаций условий
    st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
    norm1(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);

    st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
    norm2(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);

    %st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
    %norm3(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G);

    st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
    norm4(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G).

    %st_A(A),st_D(D),st_B(B),st_V(V),st_G(G),
    %norm1(A,D,B,V,G), norm3(A,D,B,V,G),ogr1(A,D,B,V,G),ogr2(A,D,B,V,G).
