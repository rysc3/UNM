function [y] = my_lagrange(x,pointx,pointy)
    % pointx : interpolatory points x
    % pointy : interpolatory points y
    % x : points to evaluate the lagrange interpolant at
    %
    
    n=length(pointx);
    L=ones(n,length(x));
    
    %We will loop through the interpolating points
    for i=1:n
      %Now we loop through all the OTHER points which are not 'i'
       for j=1:n
          if (i~=j)
             %Evaluate the 'i'th lagranbe polynomial at the points x
             L(i,:) = L(i,:).*(x-pointx(j))/(pointx(i)-pointx(j));
          end
       end
    end
    
    % 
    y=0;

    %Now loop through the interpolating points
    for i=1:n
      %And multiply the lagranbe poly. by the appropriate weight. 
       y = y + pointy(i)*L(i,:);
    end
   
end