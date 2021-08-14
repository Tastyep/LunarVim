local M = {}

function M.align(container, lines, alignment)
  local max_length = 0
  for _, line in ipairs(lines) do
    local line_len = line:len()
    if line_len > max_length then
      max_length = line_len
    end
  end

  local indent_size = math.ceil(math.max(container.width - max_length, 0) * alignment)
  local padding = string.rep(" ", indent_size)

  local output = {}
  for _, line in ipairs(lines) do
    table.insert(output, padding .. line)
  end

  return output
end

return M
