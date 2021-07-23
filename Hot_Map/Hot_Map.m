% ---------------------------------------------------------------------- % 
% Pontificie Universidade Catolica do Rio de Janeiro e TECGRAF Institute %
% Autor: Luis Felipe dos Santos Ribeiro                       Julho/2021 %
%   Program to create a HOT MAP of fibers dispersion in a specific mesh  %
%                       Some changes shold be made:                      % 
% Change input file in relation with triangular or retangular mesh       %
% ---------------------------------------------------------------------- %
clear all; close all; clc
%% Plot Control: 
show_int = [1 1];    % flag to plot elemento e numero de fibras;
show_solid = [1 1];
%% Mesh data read:
[nodes,int_inc,int_fib,solid_inc,solid_fib] = input_reader();
%% Interface elements hotmap construction: 
if show_int(1) == 1
   cohesive_hotmap(nodes,int_inc,int_fib,show_int);
end 
%% Continuous elements hotmap construction: 
if show_solid(1) == 1
   solid_hotmap(nodes,solid_inc,solid_fib,show_solid);
end 



