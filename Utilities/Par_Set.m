function par  =  Par_Set( nSig, I )
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
par.I                =      double(I);

par.nSig            =       nSig;

par.Iter             =       25;


par.step             =        4;


if nSig <=20

par.c                =        0.3*2.0*sqrt(2);  

par.w                =        0.1;   

par.lamada           =        0.5; 

par.p                =        1; 

par.win              =        6;

par.nblk             =        60;

par.Thr             =        2e-4;



elseif nSig <=30

par.c                =        0.3*2.0*sqrt(2);   

par.w                =        0.2;   

par.lamada           =        0.8;

par.p                =        0.85; 

par.win              =         7;

par.nblk             =         60;

par.Thr             =        2e-4;


elseif nSig <=40

par.c                =        1.2*2.0*sqrt(2);  

par.w                =        0.1;  

par.lamada           =        0.4; 

par.p                =        0.8; 

par.win              =         7;

par.nblk             =         60;

par.Thr             =        6e-4;


elseif nSig <=50

par.c                =        1.6*2.0*sqrt(2);   

par.w                =        0.1;   

par.lamada           =        0.4; 

par.p                =        0.75; 

par.win              =         7;

par.nblk             =         60;

par.Thr             =        2e-4;


else
    
par.c                =        1.5*2.0*sqrt(2);  

par.w                =        0.2;  

par.lamada           =        1; 

par.p                =        0.1; 

par.win              =         8;

par.nblk             =         80;

par.Thr              =        3e-3;

end

end

