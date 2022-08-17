function [Ori, Sigma, BM3D_PSNR,PSNR_Final,FSIM_Final,SSIM_Final,Time_s, iter]     =  GSRC_Test (Ori, Sigma, c, w, lamada, p, Thr,n)
randn ('seed',0);
fn               =     [Ori, '.tif'];

I                =     imread(fn);

colorI           =      I;

[~, ~, kk]       =     size (I);

if kk==3
    
    I     = rgb2gray (I);
    
    x_yuv = rgb2ycbcr(colorI);
    
    x_yuv_noise   =  x_yuv;
    
    
    x_inpaint_yuv(:,:,2) = x_yuv(:,:,2); % Copy U Componet
    
    x_inpaint_yuv(:,:,3) = x_yuv(:,:,3); % Copy V Componet
       
end

par.I            =     double(I);

par              =    Par_Set (Sigma,I, c, w, lamada, p);

par.nim          =    par.I + par.nSig* randn(size( par.I ));

[Denoising ,iter,BM3D_PSNR, Time_s]              =    GSRC_Denoising( par, Thr);

im  = Denoising{iter-1};

PSNR_Final       =   csnr (im, par.I,0,0);
FSIM_Final       =   FeatureSIM(im, par.I);
SSIM_Final       =   cal_ssim (im, par.I,0,0);

if Sigma ==20
if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_20/',Final_denoisng));

elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_20/',Final_denoisng));    

elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_20/',Final_denoisng));    
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_20/',Final_denoisng));    

else
 Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_20/',Final_denoisng));   
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_20_Color/',Final_color_denoisng));
elseif n==2
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_20_Color/',Final_color_denoisng));   
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_20_Color/',Final_color_denoisng));    
elseif n==4
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_20_Color/',Final_color_denoisng));   
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_20_Color/',Final_color_denoisng));    

elseif n==6
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_20_Color/',Final_color_denoisng));   
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_20_Color/',Final_color_denoisng));    
elseif n==8
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_20_Color/',Final_color_denoisng));   
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_20_Color/',Final_color_denoisng));   


else
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_20_Color/',Final_color_denoisng));    
end
end



elseif Sigma ==30
if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_30/',Final_denoisng));

elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_30/',Final_denoisng));
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_30/',Final_denoisng));

else
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_30/',Final_denoisng));
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==2
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==4
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_30_Color/',Final_color_denoisng));

elseif n==6
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==8
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_30_Color/',Final_color_denoisng));

else
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_30_Color/',Final_color_denoisng));
end 

end



elseif Sigma ==40
    
if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_40/',Final_denoisng));

elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_40/',Final_denoisng));
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_40/',Final_denoisng));

else
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_40/',Final_denoisng));
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==2
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==4
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_40_Color/',Final_color_denoisng));

elseif n==6
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==8
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_40_Color/',Final_color_denoisng));

else
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_40_Color/',Final_color_denoisng));
end 

end



elseif Sigma ==50
    
if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_50/',Final_denoisng));

elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_50/',Final_denoisng));
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_50/',Final_denoisng));

else
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_50/',Final_denoisng));
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==2
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==4
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_50_Color/',Final_color_denoisng));

elseif n==6
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==8
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_50_Color/',Final_color_denoisng));

else
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_50_Color/',Final_color_denoisng));
end 

end

elseif Sigma ==75

if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_75/',Final_denoisng));


elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_75/',Final_denoisng));
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_75/',Final_denoisng));

else
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_75/',Final_denoisng));
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==2
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==4
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_75_Color/',Final_color_denoisng));

elseif n==6
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==8
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_75_Color/',Final_color_denoisng));

else
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_75_Color/',Final_color_denoisng));
end 

end
    

else
    
if n==1
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results1/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==2
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results2/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==3
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results3/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==4
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results4/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==5
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results5/GSR_GST_Sigma_10/',Final_denoisng));

elseif n==6
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results6/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==7
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results7/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==8
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results8/GSR_GST_Sigma_10/',Final_denoisng));
elseif n==9
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results9/GSR_GST_Sigma_10/',Final_denoisng));

else
Final_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(im),strcat('./GSR_GST_Results10/GSR_GST_Sigma_10/',Final_denoisng));
end

if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));

if n==1      
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results1/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==2
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results2/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==3
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results3/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==4
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results4/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==5
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results5/GSR_GST_Sigma_10_Color/',Final_color_denoisng));

elseif n==6
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results6/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==7
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results7/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==8
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results8/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
elseif n==9
Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results9/GSR_GST_Sigma_10_Color/',Final_color_denoisng));

else
 Final_color_denoisng= strcat(Ori,'_GSR_GST_NEW',num2str(n),'_sigma_',num2str(Sigma),'_Times_',num2str(Time_s),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');
imwrite(uint8(x_inpaint_rgb),strcat('./GSR_GST_Results10/GSR_GST_Sigma_10_Color/',Final_color_denoisng));
end 

end

end

end

