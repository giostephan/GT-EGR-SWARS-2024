function [] = mouseDownListener(src, event)

%mouseDownListener listens for mouse clicks in the figure
%Input arguments
%   src.SelectionType
%       On Windows, this means:
%       'normal' : left mouse button clicked
%       'extend' : shift+click left OR both button clicked
%       'alt'    : ctrl+click left OR click right
%       'open'   : double click any mouse button
%       On Linux, this means:
%       'normal' : left mouse button clicked
%       'extend' : shift+click left OR click middle
%       'alt'    : ctrl+click left OR click right
%       'open'   : double click any mouse button
%       On Mac, this means:
%       'normal' : left mouse button clicked
%       'extend' : shift+click left OR click middle OR click both
%       'alt'    : ctrl+click left OR click right
%       'open'   : double click any mouse button
%Output arguments
%   none
%Notes
%   This function is called automatically by the figure
%   a mouse key is clicked, if the mouse is over the figure.
%   This function does not need to be called by the user and
%   its input arguments are supplied by the figure.  The
%   main usage would be to allow setting of a global variable
%   to detect which mouse button was clicked.

global right_button;

    switch src.SelectionType
        case 'alt'  % Right-click
        right_button = true;
        % Store mouse position to move ship to target
        global targetPos;
        [targetPos] = get_mouse_position(src);
        otherwise
        % Other mouse buttons can be ignored
        right_button = false;
    end
end