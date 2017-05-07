function [xVal,eff,opt] = UniSampleOnF(obj, N, xS, Dinfo, opt)
% XVAL = UNISAMPLEONF(OBJ,N,XS,OPT) returns a N-by-nvariable sample matrix.
% Each row of the matrix corresponds to a sample point uniformly drawn from
% the feasible set of the obj dataset. 

%  Created: May 2, 2016

if nargin < 5
   opt = generateOpt('Display',false);
end
if nargin < 3
   xS = [];
end
if nargin < 4
   Dinfo = [];
end
sopt = opt.SampleOption;
if ~obj.isConsistent(opt)
   disp('The dataset is not consistent')
   xVal = [];
else
   smethod = sopt.SampleMethod;
   switch(smethod)
      case 'Sobol'
         [xVal,eff,opt] = obj.RM_sobol(N,xS,opt);
      case 'HR'
         [xVal,eff,opt] = obj.RM_hr(N,xS,Dinfo,opt);
   end
end