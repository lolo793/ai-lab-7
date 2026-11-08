:- dynamic basket/1.


basket([coffee, milk, chocolate, apple, juice]).

start :-
    nl,
    writeln('SHOPPING LIST'),
    writeln('d. display all items.'),
    writeln('a. Add an item to the list.'),
    writeln('e. exit.'),
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    handle_choice(Choice).

handle_choice(d) :-
    basket(Items),
    display_list(Items),
    start.

handle_choice(a) :-
    write('enter the item you want to add: '),
    read(Item),
    basket(OldItems),
    retract(basket(OldItems)),
    append(OldItems, [Item], NewItems),
    assertz(basket(NewItems)),
    writeln('The item has been added'),
    start.

handle_choice(e) :-
    writeln('Exiting shopping list. Goodbye!').



display_list([]).
display_list([Head|Tail]) :-
    writeln(Head),
    display_list(Tail).