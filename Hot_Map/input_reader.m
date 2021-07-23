function [nodes,int_inc,int_fib,solid_inc,solid_fib] = input_reader()
%Read of files:
nodes = fopen('nodes.txt','r');             % Nodes Coord;
int_inc = fopen('int_inc.txt','r');         % Cohesive's incidence;
int_fib = fopen('int_fibers.txt','r');     % Fiber in cohesive elements;
% int_fib = fopen('info_hotmap.txt','r');
solid_inc = fopen('solid_inc.txt','r');     % solid's incidence;
solid_fib = fopen('solid_fibers.txt','r');   % Fiber in solid elements;
% solid_fib = fopen('info_hotmap.txt','r');
%% Nodes:
% Read of nodes:
nodes = textscan(nodes, '%f %f');
nodes = cell2mat(nodes);
%% Interface Elements:
% Read of interface elements incidence:
int_inc = textscan(int_inc, '%d %d %d %d');
int_inc = cell2mat(int_inc);
% Read of fibers in cohesive:
int_fib = textscan(int_fib, '%d %d %d %d %d %d %d');
int_fib = cell2mat(int_fib);
%% Continuous Elements: 
% Read of continuous elements incidence:
solid_inc = textscan(solid_inc, '%d %d %d');    % 3-%d se tri mesh 4-%d se quad mesh.
solid_inc = cell2mat(solid_inc);
% Read of fibers in solids:
solid_fib = textscan(solid_fib, '%d %d %d %d %d %d %d');
solid_fib = cell2mat(solid_fib);
end 