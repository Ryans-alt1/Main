function key = make_key(fname)
%MAKE_KEY Normalize a filename for GT lookup (case + extension agnostic).
[~, stem, ~] = fileparts(fname);
key = lower(stem);
end
