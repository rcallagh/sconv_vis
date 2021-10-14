function S = noisify(S, noise, rep)

% function S = noisify(S, noise)
%
% Add quadrature noise to signals S, with standard deviation 
% 'noise'.

if ~exist('rep' ,'var') || isempty(rep)
    rep = 1;
end

Nx = noise*randn([size(S), rep]);
Ny = noise*randn([size(S), rep]);
S = sqrt((S+Nx).^2 + Ny.^2);
  
