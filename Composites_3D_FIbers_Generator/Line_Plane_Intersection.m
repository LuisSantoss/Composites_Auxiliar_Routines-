function [I,rc] = Line_Plane_Intersection(u, N, n, M)

%% line_plane_intersection : function to compute the intersection point
% [I,rc] = line_plane_intersection(u, N, n, M);
% Description
% [I,rc] = line_plane_intersection(u, N, n, M) computes the coordinates of I,
% the intersection point between the line (u,N) and the plane (n,M).
% Input arguments
% - u : real row or column vector double. numel(u) = 3. One director vector of the parametric line.
% - N : real row or column vector double. numel(N) = 3. One point belonging to the line.
% - n : real row or column vector double. numel(n) = 3. One normal vector to the plane.
% - M : real row or column vector double. numel(M) = 3. One point belonging to the plane.
% Output arguments
% - I = [xI yI zI], real row or column vector double, the intersection point.
%% Input parsing
assert(nargin > 3,'Not enough input arguments.');
assert(nargin < 6,'Too many input arguments.');
if nargin < 5    
verbose = true;    
else    
assert(islogical(verbose) || isreal(verbose),'verbose must be of type either logical or real numeric.');    
end
assert(isequal(size(u),size(N),size(n),size(M)),'Inputs u, M, n, and M must have the same size.');
assert(isequal(numel(u),numel(N),numel(n),numel(M),3),'Inputs u, M, n, and M must have the same number of elements (3).');
assert(isequal(ndims(u),ndims(N),ndims(n),ndims(M)),'Inputs u, M, n, and M must have the same number of dimensions.');
%% Body
% Plane offset parameter
d = -dot(n,M);
% Specific cases treatment
if ~dot(n,u) % n & u perpendicular vectors
if dot(n,N) + d == 0 % N in P => line belongs to the plane
if verbose
% disp('(N,u) line belongs to the (M,n) plane. Their intersection is the whole (N,u) line.');
end
I = M;
rc = 2;
else % line // to the plane
if verbose
% disp('(N,u) line is parallel to the (M,n) plane. Their intersection is the empty set.');
end
I = [];
rc = 0;
end
else
% Parametric line parameter t
t = - (d + dot(n,N)) / dot(n,u);
% Intersection coordinates
I = N + u*t;
rc = 1;
end




end % line_plane_intersection