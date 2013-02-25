plays(guitar, 'Slash').
plays(drums, 'Lars Ulrich').
plays(bass, 'Nicky Wire').
plays(guitar, 'James Dean Bradfield').
plays(guitar, 'James Hetfield').

inband('James Hetfield', 'Metallica').
inband('Slash', 'Guns n Roses').
inband('Lars Ulrich', 'Metallica').
inband('James Dean Bradfield', 'Manic Street Preachers').
inband('Nicky Wire', 'Manic Street Preachers').

genre('Metallica', 'Metal').
genre('Manic Street Preachers', 'Indie').
genre('Guns n Roses', 'Metal').

instrument_genre(X, Y) :- plays(X, Z), inband(Z, W), genre(W, Y).
