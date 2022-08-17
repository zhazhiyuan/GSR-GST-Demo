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
function [im]   =  GSRC_Denoising( par,Thr )

randn ('seed',0);

Nim                =   par.nim;

Ori_im             =   par.I;

b                  =   par.win;

[h, w, ch]         =   size(Nim);

N                  =   h-b+1;

M                  =   w-b+1;

r                  =   [1:N];

c                  =   [1:M]; 

disp(sprintf('PSNR of the noisy image = %f \n', csnr(Nim, Ori_im, 0, 0) ));

Im_Out      =   Nim;

Im_BM3D     =   Nim; 

lamada      =   par.w;

nsig        =   par.nSig;

m           =   par.nblk;

cnt         =   1;

AllSSIM     =  zeros(1,par.Iter );

AllPSNR     =  zeros(1,par.Iter );

Denoising  =   cell (1,par.Iter);

for iter = 1 : par.Iter    
    
            Im_Out               =   Im_Out + lamada*(Nim - Im_Out);
        
            dif                  =   Im_Out-Nim;
        
            vd                   =      nsig^2-(mean(mean(dif.^2)));
        
       if iter==1
            
            par.nSig             =         sqrt(abs(vd)); 

            nSig_BM3D            =          par.nSig ;
            
            [~, im_BM3D]         =         BM3D(par.I, Im_BM3D, nSig_BM3D, 'np', 0);
            
             blk_arr             =         Block_matching( im_BM3D, par);    
       else
            
             par.nSig            =         sqrt(abs(vd))*par.lamada;
            
       end 
            
           AllSSIM(iter)         =         cal_ssim( Im_Out, im_BM3D, 0, 0 );

        
        if iter>1         
            
        if (AllSSIM(iter)- AllSSIM(iter-1)<Thr)||(AllSSIM(iter)- AllSSIM(iter-1))<0

              blk_arr           =          Block_matching( Im_Out, par);  
       end
        
        end
       
      
        X                       =         Im2Patch( Im_Out, par );  
        
        Ys                      =         zeros( size(X) );    
        
        W                       =         zeros( size(X) );
        
        K                       =         size(blk_arr,2);
           
    
        
        for  i  =  1 : K  
            
            
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %Noise_Group_Operator...
             B                  =         X(:, blk_arr(:, i));  
             
             mB                 =         repmat(mean( B, 2 ), 1, size(B, 2));
             
             B                  =         B-mB;   
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            TMP                 =          GSR_Temp( double(B), par.c, par.nSig, mB, par.p); %Core
           
       Ys(:, blk_arr(1:m,i))    =          Ys(:, blk_arr(1:m,i)) + TMP;
       
       W(:, blk_arr(1:m,i))     =          W(:, blk_arr(1:m,i)) + 1;
             
         end

        Im_Out   =  zeros(h,w);
        
        im_wei   =  zeros(h,w);
        
        k        =   0;
        
        for i  = 1:b
            for j  = 1:b
                k    =  k+1;
                Im_Out(r-1+i,c-1+j)  =  Im_Out(r-1+i,c-1+j) + reshape( Ys(k,:)', [N M]);
                im_wei(r-1+i,c-1+j)  =  im_wei(r-1+i,c-1+j) + reshape( W(k,:)',  [N M]);
            end
        end
        
        Im_Out  =  Im_Out./(im_wei+eps);
        
        Denoising{iter}  =   Im_Out;

        AllPSNR(iter)  = csnr( Im_Out, par.I, 0, 1 );
              
        fprintf( 'Iteration %d : nSig = %2.2f, PSNR = %f\n', cnt, par.nSig, csnr( Im_Out, par.I, 0, 1) );
        
        cnt   =  cnt + 1;

   if iter>1
       if (AllPSNR(iter)-AllPSNR (iter-1)<0.005) 
           break;
       end    
   end    
   
end
im      =      Denoising{iter-1};

disp(sprintf('PSNR of the Denoised image = %f \n', csnr(im, Ori_im, 0, 0) ));

return;




