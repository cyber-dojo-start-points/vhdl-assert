
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :red   if /assertion failed/.match(output)
  return :green if /All tests passed/.match(output)
  return :amber
}
