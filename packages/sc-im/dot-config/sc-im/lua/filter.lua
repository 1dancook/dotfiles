
current_col = sc.curcol()
current_row = sc.currow()
maxcols = sc.maxcols()
maxrows = sc.maxrows()

col_ascii = sc.colrow2a(current_row,current_col):gsub('[0-9]*', '')

debug_row = 0
function debug(description,cmd)
    sc.sc('newsheet "debug"')
    sc.sc('movetosheet "debug"')
    sc.lsetstr(0, debug_row, description)
    sc.lsetstr(1, debug_row, cmd)
    sc.sc('autofit A:B')
    debug_row = debug_row + 1
end

--debug(maxcols)
--sc.lsetstr(3,1,maxcols..'  '..maxrows)

--debug('lquery result', scquery)
--debug('maxrows', maxrows)

-- how to filter:
-- use #<(num) and number
-- use #>(num) and number
-- use #=(num) 
-- use $=(string)
-- use $~(pattern)


-- for patterns see:
-- https://riptutorial.com/lua/topic/5829/pattern-matching

-- could also implement a find and replace with this

-- first determine what kind of filer:
query = sc.lquery('Filter: ')

filter = {}
filter.mode = '' -- 'number' or 'string'
filter.method = '' -- one of > < = *
filter.string = '' -- number or string

if not(query) then
    return
elseif string.find(query, "^#=") then
    filter.string = query:gsub("^#=", '')
    filter.mode = 'number'
    filter.method = '='
elseif string.find(query, "^#<") then
    filter.string = query:gsub("^#<", '')
    filter.mode = 'number'
    filter.method = '<'
elseif string.find(query, "^#>") then
    filter.string = query:gsub("^#>", '')
    filter.mode = 'number'
    filter.method = '>'
elseif string.find(query, "^$~") then
    filter.string = query:gsub("^$~", '')
    filter.mode = 'string'
    filter.method = '~'
elseif string.find(query, "^$=") then
    filter.string = query
    filter.mode = 'string'
    filter.method = '='
end

-- convert number
if filter.mode == 'number' then
    filter.string = tonumber(filter.string)
end


function hiderow(row)
    sc.sc('hiderow '..row)
end

-- these will iterate through the rows until the current row
-- so it's necessary for this to be called after using # to get to the
-- last valid cell in the column
-- go through rows for number
if filter.mode == 'number' then
    for row = 0, sc.currow() do
        cell_num = sc.lgetnum(current_col,row)
        if (filter.method == '=' and cell_num ~= filter.string) then
            hiderow(row)
        elseif (filter.method == '<' and cell_num > filter.string) then
            hiderow(row)
        elseif (filter.method == '>' and cell_num < filter.string) then
            hiderow(row)
        end
    end
end

-- go through rows for the label
if filter.mode == 'string' then
    for row = 0, sc.currow() do
        label = sc.lgetstr(current_col, row)
        if (filter.method == '=' and filter.string ~= label) then
            hiderow(row)
        elseif (filter.method == '~' and not(string.find(label,filter.string))) then
            hiderow(row)
        end
    end
end

