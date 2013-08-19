function Dn = combinations(vector, count)
    VectorLength = length(vector); % vector length
    cursorsLastPointer = VectorLength - count + 1:VectorLength; % last cursors combination position
    LastCombination = vector(cursorsLastPointer); % last possible combination
    cursors = 1:count; % cursors - save last combination position
    cursorLastPointer = count; % default cursor must be on first position
    counter = 1;
    while isequal(cursorsLastPointer, cursors) == 0
        for i = 1:count
            Dn(counter, i) = vector(cursors(i));
        end;
        
        while vector(cursors(cursorLastPointer)) == LastCombination(cursorLastPointer)
            cursorLastPointer -= 1;
        end;
        
        cursors(cursorLastPointer) += 1;
        
        while cursorLastPointer != count
            cursors(cursorLastPointer + 1) = cursors(cursorLastPointer) + 1;
            cursorLastPointer += 1;
        end;
        
        counter += 1;
    end;
    Dn(counter,:) = LastCombination;
end;