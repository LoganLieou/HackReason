% transition graph
%light_graph(green, X, yellow).
%light_graph(yellow, X, red).
%light_graph(red, X, green).

% define perpendicular rules
perpendicular(north, west).
perpendicular(north, east).
perpendicular(west, north).
perpendicular(east, north).
perpendicular(south, west).
perpendicular(south, east).
perpendicular(west, south).
perpendicular(east, south).

