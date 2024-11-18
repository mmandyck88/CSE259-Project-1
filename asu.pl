/*
Project 1 - asu.pl
CSE 259 Professor Osburn
*/

%----------Draw symbol Function----------
drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :-
    N > 0,
    write(Symbol),
    N1 is N - 1,
    drawSymbol(Symbol, N1).

%----------Draw Horizontal Line Function----------
drawHLine(0) :- write('\n').
drawHLine(N) :-
    N > 0,
    write('-'),
    N1 is N - 1,
    drawHLine(N1).

%------Draw Vertical Line Function----------
drawVSpace(0, LineLen).
drawVSpace(N, LineLen) :-
    N > 0,
    write('|'),
    drawSymbol(' ', LineLen),
    write('|'),
    write('\n'),
    N1 is N - 1,
    drawVSpace(N1, LineLen).

%----------ASU Main Function ----------
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextSize) :-
    TextWidth is TextSize * 3,
    TextHeight is TextSize * 5,
    LineLen is TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2 + 2,
	drawHLine(LineLen),
	drawVSpace(BottomTopMargin,LineLen-2),
    drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, TextSize, 0),
	drawVSpace(BottomTopMargin,LineLen-2),
	drawHLine(LineLen).

%---------Draw 'ASU' Formatting LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, TextSize, TextHeight--------
drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, TextSize, TextHeight).
drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, TextSize, Line) :-
    Line < TextHeight,
    write('|'),
    drawSymbol(' ', LeftRightMargin),
    letterA(TextWidth, TextHeight, TextSize, Line, 0),
    drawSymbol(' ', SpaceBetweenCharacters),
    letterS(TextWidth, TextHeight, TextSize, Line, 0),
    drawSymbol(' ', SpaceBetweenCharacters),
    letterU(TextWidth, TextHeight, TextSize, Line, 0),
    drawSymbol(' ', LeftRightMargin),
    Next is Line + 1,
    write('|'),
    nl,
    drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, TextSize, Next).


%----------'A' Letter Creation------------
letterA(TextWidth, TextHeight, TextSize, Line, TextWidth).
letterA(TextWidth, TextHeight, TextSize, Line, Col) :-
	((Line >= TextSize, Line < 2 * TextSize);(Line >= TextWidth, Line < 4 * TextSize);(Line >= TextSize * 4, Line < TextHeight)),
	((Col >= 0,Col < TextSize);
	(Col >= 2 * TextSize,Col < TextWidth)),
	drawSymbol('*', TextSize),
	NextCol is Col + TextSize,
	letterA(TextWidth, TextHeight, TextSize, Line, NextCol). % Column 0, 2 all rows draw '*'

letterA(TextWidth, TextHeight, TextSize, Line, Col) :-
	((Line >= TextSize, Line < 2 * TextSize);(Line >= TextWidth, Line < 4 * TextSize);(Line >= 4 * TextSize, Line < TextHeight)),
	Col >= 1 * TextSize,
	Col < 2 * TextSize,
	drawSymbol(' ', TextSize),
	NextCol is Col + TextSize,
	letterA(TextWidth, TextHeight, TextSize, Line, NextCol). % Column 1, all 1, 3, 4 draw ' '

letterA(TextWidth, TextHeight, TextSize, Line, Col) :-
    ((Line >= 0, Line < TextSize); (Line >= 2 * TextSize, Line < TextWidth)),
    Col < TextWidth,
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterA(TextWidth, TextHeight, TextSize, Line, NextCol). % Column 1 all rows draw '*'

%-----'S' Letter Creation---------


letterS(TextWidth, TextHeight, TextSize, Line, TextWidth).
letterS(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= TextSize, Line < 2 * TextSize),(Col >= 0,Col < TextSize),
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterS(TextWidth, TextHeight, TextSize, Line, NextCol).

letterS(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= TextSize, Line < 2 * TextSize),
    Col >= 1 * TextSize,
    Col < TextWidth,
    drawSymbol(' ', TextSize),
    NextCol is Col + TextSize,
    letterS(TextWidth, TextHeight, TextSize, Line, NextCol).  

letterS(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= TextWidth, Line < 4 * TextSize),(Col >= 2 * TextSize,Col < TextWidth),
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterS(TextWidth, TextHeight, TextSize, Line, NextCol). 

letterS(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= TextWidth, Line < 4 * TextSize),
    Col >= 0,
    Col < 2 * TextSize,
    drawSymbol(' ', TextSize),
    NextCol is Col + TextSize,
    letterS(TextWidth, TextHeight, TextSize, Line, NextCol).  

letterS(TextWidth, TextHeight, TextSize, Line, Col) :-
    ((Line >= 0, Line < TextSize); (Line >= 2 * TextSize, Line < TextWidth); (Line >= 4 * TextSize, Line <TextHeight)),
    Col < TextWidth,
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterS(TextWidth, TextHeight, TextSize, Line, NextCol). 


%-----------'U' Letter Creation--------------

letterU(TextWidth, TextHeight, TextSize, Line, TextWidth).
letterU(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= 0, Line < 4 * TextSize),
    ((Col >= 0,Col < TextSize);(Col >= 2 * TextSize,Col < TextWidth)),
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterU(TextWidth, TextHeight, TextSize, Line, NextCol). 

letterU(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= 0, Line < 4 * TextSize),
    (Col >= 1 * TextSize, Col < 2 * TextSize),
    drawSymbol(' ', TextSize),
    NextCol is Col + TextSize,
    letterU(TextWidth, TextHeight, TextSize, Line, NextCol). 

letterU(TextWidth, TextHeight, TextSize, Line, Col) :-
    (Line >= 4 * TextSize, Line < TextHeight),
    Col < TextWidth,
    drawSymbol('*', TextSize),
    NextCol is Col + TextSize,
    letterU(TextWidth, TextHeight, TextSize, Line, NextCol).
