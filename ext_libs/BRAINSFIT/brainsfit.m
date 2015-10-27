function brainsfit(fixedfilename, movingfilename, coregisteredoutputvolume)

% Wrapper for BRAINSFit

fixparams = [' --useRigid --useAffine' ...
              ' --samplingPercentage 0.005' ...
              ' --removeIntensityOutliers 0.005' ...
              ' --initializeTransformMode useGeometryAlign' ...
              ' --interpolationMode Linear'];

basename = [fileparts(mfilename('fullpath')), filesep, 'BRAINSFit'];

if ispc
    BRAINSFit = [basename, '.exe '];
elseif isunix
    BRAINSFit = [basename, '.', computer, ' '];
end

system([BRAINSFit, fixparams, ...
        ' --fixedVolume ' , fixedfilename, ...
        ' --movingVolume ', movingfilename, ...
        ' --outputVolume ', coregisteredoutputvolume]);