

function w = notewindows(data)
% this is basically just a nice,pretty wrapper for noteparse

divs = noteparse(data);

d2(1) = 0;

for i=1:length(divs)
    d2(i+1)=divs(i);
end

d2(length(divs)+2) = length(data);

for i=1:length(d2)/2
    w(i) = (d2(2*i-1) + d2(2*i))/2;
end