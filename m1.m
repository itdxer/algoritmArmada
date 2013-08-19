%script
clc
load M.dat;
   
% all unique numbers in second row in data M
D = unique(M(:,2));

% --------------- D1 ---------------
% counted all matched combinathions D1 in data M
D1 = countInnerCombination(M, D)

% --------------- D2 ---------------
% find all unique posible combinations with 2 parameters
D2 = combinations(D, 2);
% counted all matched combinathions D2 in data M
D2 = countInnerCombination(M, D2)

% --------------- D3 ---------------
% find all unique posible combinations with 3 parameters
D3 = combinations(D, 3);
% counted all matched combinathions D3 in data M
D3 = countInnerCombination(M, D3)

counter = 1;
comb2 = [1 2 3; 1 3 2; 2 3 1];
comb1 = [1 2 3; 2 1 3; 3 1 2];
for i = 1:length(D3(:,1))
	for j = 1:3
		rules{counter, 1} = [num2str(D3(i, comb2(j, 1))),' U ', num2str(D3(i, comb2(j, 2))), ' => ', num2str(D3(i, comb2(j, 3)))];
		rules{counter, 2} = D3(i, 4) / D2(D2(:, 1) == D3(i, comb2(j, 1)) & D2(:, 2) == D3(i, comb2(j, 2)), 3);
		counter += 1;
	end;
	
	for j = 1:3
		rules{counter, 1} = [num2str(D3(i, comb1(j, 1))),' => ', num2str(D3(i, comb1(j, 2))), ' U ', num2str(D3(i, comb1(j, 3)))];
		rules{counter, 2} = D3(i, 4) / D1(D1(:, 1) == D3(i, comb1(j, 1)), 2);
		counter += 1;
	end;
end;
rules

j = 1;
min_conf = 0.7;
for i = 1:length(rules)
	if rules{i, 2} > min_conf
		rules_f{j,1} = rules{i, 1};
		rules_f{j,2} = rules{i, 2}; 
		j = j + 1;
	end;
end;
rules_f