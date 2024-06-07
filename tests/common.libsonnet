local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 99/* Overflow to get the whole remainder */);

{
  lowerCaseFirstChar: lowerCaseFirstChar,
}
