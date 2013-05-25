function [ landmarkRepresentor ] = GenerateOneLandmarkVector( landmark, origin, z, landmarkHistogram )
% landmark is 1 x 2
% origin is 1 x 2
% landmarkHistogram is Q x 2

landmarkHistogramBinsCenters = landmarkHistogram(:,1);
Q = length(landmarkHistogramBinsCenters);

% calc the landmark distance from the origin
distance = CalculateDistance(landmark,origin);

histogramDiffFromLandmark = abs(landmarkHistogramBinsCenters' - distance);
[~,IX] = sort(histogramDiffFromLandmark);

% set the landmarkRepresentor bits
landmarkRepresentor = zeros(Q,1);
for i=1:z
    landmarkRepresentor(IX(i)) = 1;
end

end

