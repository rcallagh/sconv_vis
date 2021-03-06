function plot_amp(S, scheme, S_sd, col)

% function plot_amp(S, scheme, transparency)
%
% Plot amplitudes 'S' for the set of directions given 
% in 'scheme', with optional colour and transparency
% specified.

if ~exist('col', 'var') || isempty(col)
    colour_S = [ 1 1 0 ];
else
    colour_S = col(1:3);
end
negcolour = [ 1 1 1 ];
if ~exist('col', 'var') || isempty(col)
    transparency_S = 0.8;
else
    transparency_S = col(4);
end
colour_S_sd = [ 1 1 1 ];
transparency_S_sd = 0.4;

range = 1.5*max(S);

% cla
% set(gca, 'Color', [1 1 1], ...
%          'CameraViewAngleMode', 'manual', ...
%          'CameraViewAngle', 20, ...
%          'CameraTarget', [ 0 0 0 ], ...
%          'CameraPosition', 6*range*[0 0 1], ...
%          'Visible', 'on', ...
%          'Box', 'on', ...
%          'XLim', [ -range range ], ...
%          'YLim', [ -range range ], ...
%          'ZLim', [ -range range ]);

S2 = -S;
k = find(S<0);
k2 = find(S>=0);
S(k) = 0;
S2(k2) = 0;

V = scheme.vert .* (S*[ 1 1 1 ]);
V2 = scheme.vert .* (S2*[ 1 1 1 ]);

h = patch('Vertices', V, 'Faces', scheme.mesh); 
set(h, 'LineStyle', 'None', ...
    'FaceLighting', 'Phong', ...
    'SpecularStrength', 0.6, ...
    'FaceColor', colour_S, ...
    'FaceAlpha', transparency_S);

h2 = patch('Vertices', V2, 'Faces', scheme.mesh); 
set(h2, 'LineStyle', 'None', ...
        'FaceLighting', 'Phong', ...
        'SpecularStrength', 0.6, ...
        'FaceColor', negcolour, ...
        'FaceAlpha', transparency_S);

if exist('S_sd') && ~isempty(S_sd)
  S(k2) = S(k2) + 2*S_sd(k2);
  S2(k) = S2(k) - 2*S_sd(k);

  V = scheme.vert .* (S*[ 1 1 1 ]);
  V2 = scheme.vert .* (S2*[ 1 1 1 ]);

  h = patch('Vertices', V, 'Faces', scheme.mesh); 
  set(h, 'LineStyle', 'None', ...
  'FaceLighting', 'Phong', ...
  'SpecularStrength', 0.6, ...
  'FaceColor', colour_S_sd, ...
  'FaceAlpha', transparency_S_sd);

  h2 = patch('Vertices', V2, 'Faces', scheme.mesh); 
  set(h2, 'LineStyle', 'None', ...
  'FaceLighting', 'Phong', ...
  'SpecularStrength', 0.6, ...
  'FaceColor', colour_S_sd, ...
  'FaceAlpha', transparency_S_sd);
end

light('position', [0 1 1]);

%drawnow
