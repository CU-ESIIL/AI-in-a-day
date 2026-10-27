--[[
docx-tables.lua: make Markdown tables readable when converting to .docx.

- Sizes each column by how much text it holds, instead of giving every column
  the same width.
- Puts table text in the small "Table Text" / "Table Heading" paragraph styles
  defined in reference.docx.

Usage (from the repository root):

  pandoc -f gfm _unrendered/mod-03_comparison-and-outline.md \
    --reference-doc=_unrendered/pandoc-docx/reference.docx \
    --lua-filter=_unrendered/pandoc-docx/docx-tables.lua \
    -o mod-03_comparison-and-outline.docx

"-f gfm" reads the file as GitHub-flavoured Markdown, the way it was written.
Pandoc's default reader needs a blank line before a list, and several lists in
the outline follow a paragraph directly.
]]

-- Smallest share of the page width any column may get.
local MIN_WIDTH = 0.08
-- Roughly how many characters of 8.5 pt table text fit across the page; used
-- to keep each column at least as wide as its longest word.
local CHARS_PER_LINE = 100
-- Ignore "words" longer than this (URLs, file paths) when setting minimums.
local MAX_WORD = 18

-- Text weight of one cell. The square root stops a single very long cell from
-- claiming most of the page.
local function cell_weight(cell)
  local n = utf8.len(pandoc.utils.stringify(cell.contents)) or 0
  return math.sqrt(n)
end

local function column_widths(tbl)
  local ncol = #tbl.colspecs
  local weight, longest = {}, {}
  for i = 1, ncol do weight[i] = 1; longest[i] = 0 end

  local function add_rows(rows)
    for _, row in ipairs(rows) do
      local col = 1
      for _, cell in ipairs(row.cells) do
        local span = cell.col_span or 1
        for k = col, math.min(col + span - 1, ncol) do
          weight[k] = weight[k] + cell_weight(cell) / span
        end
        if span == 1 and col <= ncol then
          for word in pandoc.utils.stringify(cell.contents):gmatch("%S+") do
            local n = utf8.len(word) or #word
            if n <= MAX_WORD and n > longest[col] then longest[col] = n end
          end
        end
        col = col + span
      end
    end
  end

  add_rows(tbl.head.rows)
  for _, body in ipairs(tbl.bodies) do add_rows(body.body) end

  local total = 0
  for i = 1, ncol do total = total + weight[i] end
  local widths, sum = {}, 0
  for i = 1, ncol do
    local floor = math.max(MIN_WIDTH, (longest[i] + 2) / CHARS_PER_LINE)
    widths[i] = math.max(floor, weight[i] / total)
    sum = sum + widths[i]
  end
  for i = 1, ncol do widths[i] = widths[i] / sum end
  return widths
end

-- The docx writer only applies a custom style to paragraphs, not to the
-- "Plain" blocks that table cells usually contain, so convert those first.
local function styled(style)
  local function wrap(el)
    return pandoc.Div({ pandoc.Para(el.content) }, { ["custom-style"] = style })
  end
  return { Plain = wrap, Para = wrap }
end

function Table(tbl)
  if #tbl.colspecs > 1 then
    local widths = column_widths(tbl)
    for i, spec in ipairs(tbl.colspecs) do
      tbl.colspecs[i] = { spec[1], widths[i] }
    end
  end

  for _, row in ipairs(tbl.head.rows) do
    for _, cell in ipairs(row.cells) do
      cell.contents = cell.contents:walk(styled("Table Heading"))
    end
  end
  for _, body in ipairs(tbl.bodies) do
    for _, row in ipairs(body.body) do
      for _, cell in ipairs(row.cells) do
        cell.contents = cell.contents:walk(styled("Table Text"))
      end
    end
  end
  return tbl
end
