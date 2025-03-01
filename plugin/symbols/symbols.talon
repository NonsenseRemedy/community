new line: "\n"
double dash: "--"
triple quote: "'''"
triple grave | triple back tick | gravy: "```"
(dot dot | dotdot): ".."
(dot dot dot | dotdotdot): "..."
ellipsis: "..."
comma and | spamma: ", "
arrow: "->"
dub arrow: "=>"
void: " "
coalgap: ": "
semi: ";"
slurp: key(delete)

# Insert delimiter pairs
<user.delimiter_pair>: user.delimiter_pair_insert(delimiter_pair)

# Wrap selection with delimiter pairs
<user.delimiter_pair> that: user.delimiter_pair_wrap_selection(delimiter_pair)
