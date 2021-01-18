function d = xyspace(A,x,y)
idx1 = find(ismember(A,x));
idx2 = find(ismember(A,y));
x = union(idx1,idx2);
whichset = ismember(x,idx1) + 2*ismember(x,idx2);
idx = diff(whichset)>0;
d = x([false,idx]) - x([idx,false]);

end