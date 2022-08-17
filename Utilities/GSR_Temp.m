function  X   =   GSR_Temp( Y, c, nsig, mB, p )
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

U                  =    getsvd(Y); % generate PCA basis

A0                 =    U'*Y; %49*60

s0                 =    mean (A0.^2,2); %49*1

s0                 =    max  (0, s0-nsig^2); %49*1

LambdaM            =    repmat ( c*nsig^2./(sqrt(s0)+eps),[1, size(A0,2)]); %Generate the weight  49*60

Alpha              =    solve_Lp_w (A0, LambdaM, p);%GST Algorithm
 
X                  =    U*Alpha;

X                  =    X + mB;

return;