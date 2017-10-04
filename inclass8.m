%AW: see comments below. 0.95/1.


%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
% C. run swalign on the two sequences with the default parameters
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 

%% A
rand_seq=randdnaseq(100);

%% B
rand_seq2=[rand_seq(1:40) randdnaseq(20) rand_seq(61:100)];

%% C
%    swalign(..., 'GAPOPEN', penalty) specifies the penalty for opening a gap
%    in the alignment. The default gap open penalty is 8.

[score, align, start]=swalign(rand_seq,rand_seq2,'Alphabet','nt','Showscore',true);

%% D
[score1, align1, start1]=swalign(rand_seq,rand_seq2,'Alphabet','nt','ScoringMatrix',nuc44,'GapOpen',2,'Showscore',true);
[score2, align2, start2]=swalign(rand_seq,rand_seq2,'Alphabet','nt','ScoringMatrix',nuc44,'GapOpen',15,'Showscore',true);

%AW: there is a very simple difference in terms of the alignments. One puts in gaps (because the penalty is low), while
% the other forces mismatches (because the penalty for gaps is too high). -0.05. 

%Miguel Angel: if you put the gap open lower in the first sequence, you're
%telling matlab that you have more range for error, which means that a
%value for example of 10 won't be that much different from an 11. On the
%second alignment by increasing the GapOpen you're making the comparison
%much sensible, which means that each gap penalty will have a higher impact
%on comparing the sequences. That is why at the moment of grpahing them,
%for the first graph you have a darker colored plot, because you will have
%higher values plotted, and comparing it against graph 2, which is lighter
%colored, the path for the comparison is more distinguishable is because
%there is now a greater difference from getting a 350 value vs. 0 value

%% E

% swalign(..., 'EXTENDGAP', penalty) specifies the penalty for extending a
%     gap in the alignment. If EXTENDGAP is not specified, then extensions to
%     gaps are scored with the same value as GAPOPEN.

[score3, align3, start3]=swalign(rand_seq,rand_seq2,'Alphabet','nt','ScoringMatrix',nuc44,'GapOpen',2,'Showscore',true,'EXTENDGAP', 15);

%Miguel Angel: by increasing the penalty for Extending the gap, you are
%heavily penalizing for each extra letter you skip. That is why this figure,
%(figure 3) looks like a "merge" plot between 1 and 2. Because the low gap
%doesn't penalize much, which makes higher scores but when skipping an
%extra letter, you'll get a huge penalization now, thus creating a
%more sensible plot for consecutive mismatches.

%AW: I'm not sure what you mean by sensible, but ok. the point is that the gaps will be short. 

%% F

[score4, align4, start4]=swalign(rand_seq,rand_seq2,'Alphabet','nt','ScoringMatrix',nuc44,'Showscore',true,'EXTENDGAP', 15);

%Miguel Angel : This will give you a more sensible plot now because the Gap
%Open is for default 8, this will give you a standard gap, but, with a high
%extended gap you're creating a much more sensitive plot. That is why there
%is a greater gap within the highest value and lowest. This graph 4 is more
%close to graph 2, because has a higher discrimination criteria for
%mismatch nucleotides.

%AW: the point is that there will be fewer gaps than (E) because of the higher GapOpen paramter,
%but they will be long. 
