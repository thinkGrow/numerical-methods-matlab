A = [ 1 1 -1;
      2 1 1;
      1 -1 -1;];
  
b = [0;
     5
     -2];
 
Aug = [A,b];

row = 1;
[maxValue maxIndex] = max(Aug(:,1));

temp = Aug(maxIndex,:);
Aug(maxIndex,:) = Aug(row,:);
Aug(row,:) = temp;

pivot = Aug(row,1);
f_21 = Aug(2,1)/pivot;
f_31 = Aug(3,1)/pivot;

Aug(2,:) = Aug(2,:) - f_21 * Aug(1,:);
Aug(3,:) = Aug(3,:) - f_31 * Aug(1,:);

Aug

row = 2;

[maxValue maxIndex] = max(abs(Aug(2:3,2)));

temp = Aug(maxIndex,:);
Aug(maxIndex,:) = Aug(row,:);
Aug(row,:) = temp;

pivot = Aug(row,2);
f_32 = Aug(3,2)/pivot;

Aug(3,:) = Aug(3,:) - f_32 * Aug(2,:);




Aug