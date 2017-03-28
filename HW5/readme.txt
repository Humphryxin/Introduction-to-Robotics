This file contains the information about the usage of functions.

function x = project(X,R,T,K)
%%% convert the 3D coordinates to 2D coordinates given the intrinsic and extrinsic parameters

PerspectiveProjection.m
%%% examples showing the function usage and the plot of the 2D coordinates

function [R, T, K] = calibration2Dto3D(X,x)
%%% Calibration given the corresponding 2D and 3D coordinates.

CameraCalibration3D.m
%%%  check the correctness of calibration2Dto3D function

function [R Q]=rq(A)
%%% rq decomposition, the code is copied from the internet
%%% it uses the qr decomposition and some matrix transformations inside