function keys = make_key_variants(fname)
%MAKE_KEY_VARIANTS Generate tolerant lookup keys for an image filename.
%  - case-insensitive
%  - ignores extension and folder
%  - adds zero-padding stripped variant for trailing numbers
%
% Returns a cell array of unique keys ordered from strict->loose.

base = make_key(fname);
keys = {base};

% If the name ends with digits, add an unpadded version (e.g., image_00012 -> image_12)
toks = regexp(base, '^(.*?)(\d+)$', 'tokens');
if ~isempty(toks)
    prefix = toks{1}{1};
    digits = toks{1}{2};
    unpadded = regexprep(digits, '^0+', '');
    if isempty(unpadded), unpadded = '0'; end
    keys{end+1} = [prefix unpadded]; %#ok<AGROW>
end

keys = unique(keys, 'stable');
end
