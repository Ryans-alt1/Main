function [has, boxes, usedKey] = gt_lookup(gtMap, imgName)
%GT_LOOKUP Find GT boxes for an image name with tolerant matching.
%   - case-insensitive, ignores extension/folder
%   - matches padded/unpadded numeric suffixes (image_00123 vs image_123)
% Returns: has (bool), boxes (Nx4), usedKey (matched key or '').

has = false; boxes = []; usedKey = '';
if nargin<2 || isempty(gtMap) || ~isa(gtMap,'containers.Map'), return; end

variants = make_key_variants(imgName);
for k = 1:numel(variants)
    key = variants{k};
    if isKey(gtMap, key)
        boxes = gtMap(key);
        has = true;
        usedKey = key;
        return;
    end
end
end
