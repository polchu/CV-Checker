:- dynamic yes/1,no/1.
start :- condition(Disease),
      write('Patient may have: '),
      write(Disease),
      nl.

condition(coronavirus) :-
    has(fever),
    has(cough),
    has(shortness_of_breath),
	has(chills),
    has(muscle_pain_aches_or_discomfort),
    has(sore_throat),
    has(loss_of_taste_or_smell),
    has(trouble_breathing),
    has(pain_or_pressure_in_chest_area),
    has(blush_lips_or_face),
    has(tiredness_or_fatigue),
    has(congestion),
    has(diarrhea).

condition(pneumonia) :-
    has(fever),
    has(cough),
    has(shortness_of_breath),
	has(chills),
    has(muscle_pain_aches_or_discomfort),
    has(sore_throat),
    has(trouble_breathing),
    has(pain_or_pressure_in_chest_area),
    has(tiredness_or_fatigue).

condition(flu) :-
    has(fever),
    has(cough),
    has(muscle_pain_aches_or_discomfort),
    has(sore_throat),
    has(tiredness_or_fatigue),
    has(diarrhea).

condition(measles) :-
    has(fever),
    has(cough),
    has(sore_throat),
    has(rashes_or_red_spots),
    has(red_or_watery_eyes).


condition(unknown) :-
    write("Cannot determine disease. Please contact your doctor for detailed checkup."),
    nl.

ask(Question) :-
    write('Does you have the following symptom(s): '),
    write(Question),
    write('? '),
    read(Response),
    nl,
  ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail
	).

has(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).
