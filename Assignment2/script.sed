
# no more than once space between tokens / no trailing whitespace
s/[ \t]*$//g

# ignores comments and deletes extra spaces
/(^\/.*| +\/|\**\/|#.*|"%|" +%)/! s/([^ ]) +/\1 /g

# concatenates space between if and (
s/([if ]) +(\()/\1\2/g

# ignore comments and insert space before operators
/(^\/.*| +\/|\**\/|#.*|"%|" +%)/! s/([^ ])(\+|\-|\*|\/|!=|==|=|<=|>=|<|>|&&|\|\||\^|\%)/\1 \2/g

# ignore comments and insert space after operators
/(^\/.*| +\/|\**\/|#.*|"%|" +%)/! s/(\+|\-|\*|\/|!=|==|=|<=|>=|<|>|&&|\|\||\^|\%)([^ ])/\1 \2/g
