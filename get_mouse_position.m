function [mousePos] = get_mouse_position(~)
%get_mouse_position gets the current mouse position
%Input arguments:
%   mainAxis - axes object
%Output arguments
%   mousePos - 2 element vector containing: [x y]
    global mainAxis;
    % Get the current point in axes data units
    tempMousePos = get(mainAxis, 'CurrentPoint');
    mousePos = tempMousePos(1, 1:2);
end
