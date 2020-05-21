/// @description replace arguments in String: {1}, {2}, {3} ...
/// @param {string} text
/// @param {string} ...

var text = argument[0];

for(var i = 1; i < argument_count; i += 1) {
	text = string_replace_all(text, "{" + string(i) + "}", string(argument[i]));
}

return text;