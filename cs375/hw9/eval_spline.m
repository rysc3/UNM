function y = eval_spline(t,coeffs,x)
    % t is a vector of the locations of the spline knots
    % coeffs is an array of the coefficients for the cubic spline
    %   by assumption, coeffs(j,:) contains the coefficients for the 
    %   j'th sub-cubic (on a single row)
    %   The first column of coeffs contains the constant coefficient, 
    %   the second column contains the linear coefficient
    %   the third column contains the quadratic coefficient
    %   and the final column contains the cubic coefficient
    % x is the SCALAR location that you wish to evaluate the spline
    n = length(t);

    j = sum(t<=x);
    j = max(j,1);
    j = min(j,n-1);
    x;

    y = coeffs(j,1)+coeffs(j,2)*(x-t(j)) + ...
        coeffs(j,3)*(x-t(j)).^2 + coeffs(j,4)*(x-t(j)).^3;

end