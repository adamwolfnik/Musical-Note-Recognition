function divs = noteparse(data)
len = length(data)



threshup = .2 * max(data);  % 20% of the maximum value
threshdown = .04 * max(data);

quiet=1;  
j=1;

for i=51:len-50
    k=i-50:i+50;
   if quiet == 1 
      if (max(abs(data(k))) > threshup)
         quiet = 0;  
         divs(j) = i; 
         j=j+1;
      end
	else
      if (max(abs(data(k))) < threshdown)
         quiet = 1;
         divs(j) = i;
         j=j+1;
      end
   end
end