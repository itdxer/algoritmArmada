function countCombination = countInnerCombination(data, combinations)
    [rows, cols] = size(combinations); 
    uniqueNumbers = unique(data(:, 1)); % all unique numbers in first row in data
    uniqueNumbersLength = length(uniqueNumbers); % count of unique numbers
    countCombination = combinations; 
    countCombination(:, cols + 1) = 0;
    for i = 1:rows
        combinationLastHistory = [0 0];
        thisRow = combinations(i,:);
        for j = 1:cols
            combinationLastHistory = [combinationLastHistory; data(data(:, 2) == thisRow(j), :)];
        end;
        for k = 1:uniqueNumbersLength
            [findRows, findCols] = size(combinationLastHistory(combinationLastHistory(:, 1) == uniqueNumbers(k), :));
            if findRows >= cols
                countCombination(i, cols + 1) += 1;
            end;
        end;
    end;
	countCombination = countCombination(countCombination(:, cols + 1) >= 2, :); % deleted all less then 2 rows