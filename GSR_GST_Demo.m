% =========================================================================
% Non_Convex Weighted L_p Minimization based Group Sparse Representation
% Framework for Image Denoising, Version 1.0
% Copyright(c) 2017 Zhiyuan Zha
% All Rights Reserved.
%
% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------

clc;

clear;

close all;

Ori = 'House256';

rand('seed',0);
fn               =     [Ori, '.tif'];

I                =     imread(fn);

par.I            =     double(I);

idx              =     2;

L                =    [20, 30, 40, 50];

par              =    Par_Set (L(idx),I);

par.nim          =    par.I + par.nSig* randn(size( par.I ));

im               =    GSRC_Denoising( par, par.Thr );

imwrite(uint8(im),'.\GSR_GST_Results\House_Denoising.tif');

figure; imshow(im,[]);

