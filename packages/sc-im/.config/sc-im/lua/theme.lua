dofile('helloworld.lua')

ncurses_colors = {'BLACK','WHITE','RED','YELLOW','GREEN','BLUE','MAGENTA'}

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function redefine_color(color_name, rgb)
    execstring = 'REDEFINE_COLOR '..'"'..color_name..'" '..rgb
    sc.sc(execstring)
end

function define_color(color_name, rgb)
    execstring = 'DEFINE_COLOR "'..color_name..'" '..rgb
    sc.sc(execstring)
end

function apply_style(style_type, style_string)
    execstring = 'COLOR "type='..style_type..' '..style_string..'"'
    sc.sc(execstring)
end

function apply_theme(theme)
    -- first apply color deinitions
    for key,value in pairs(theme.colors) do
        --key = color name
        --value = value (r,g,b)
        color_name = key:upper()
        if has_value(ncurses_colors, color_name) then
            redefine_color(color_name, value)
        else
            define_color(color_name, value)
        end
    end

    -- next apply styles
    for key,value in pairs(theme.styles) do
        -- key = type name
        -- value = style string
        style_type = key:upper()
        apply_style(style_type, value)
    end

end

theme = { colors={}, styles={} }
theme.colors.DARKGRAY = "46 46 46"
theme.colors.MEDGRAY = "70 70 70"
theme.colors.LIGHTERGRAY = "190 190 190"
theme.colors.COMMENT = "100 100 100"
theme.colors.BLACK = "30 0 0"

theme.styles.CELL_CONTENT = "fg=WHITE bg=DEFAULT_COLOR"
theme.styles.CELL_ERROR = "fg=WHITE bg=RED"
theme.styles.CELL_FORMAT = "fg=COMMENT bg=MEDGRAY"
theme.styles.CELL_ID = "fg=BLACK bg=GREEN bold=1"
theme.styles.CELL_NEGATIVE = "fg=RED bg=DEFAULT_COLOR"
theme.styles.CELL_SELECTION = "fg=BLACK bg=LIGHTERGRAY bold=1"
theme.styles.CELL_SELECTION_SC = "bg=GREEN fg=BLACK bold=1"
theme.styles.DATEF = "fg=WHITE bg=DEFAULT_COLOR"
theme.styles.ERROR_MSG = "fg=BLACK bg=YELLOW"
theme.styles.EXPRESSION = "fg=BLUE bg=DEFAULT_COLOR"
theme.styles.GRID_ODD = "fg=WHITE bg=DARKGRAY"
theme.styles.HEADINGS = "fg=WHITE bg=MEDGRAY"
theme.styles.HEADINGS_ODD = "fg=WHITE bg=MEDGRAY"
theme.styles.INFO_MSG = "fg=YELLOW bg=DEFAULT_COLOR bold=0"
theme.styles.INPUT = "fg=WHITE bg=DEFAULT_COLOR"
theme.styles.MODE = "fg=BLUE bg=DEFAULT_COLOR"
theme.styles.NORMAL = "fg=WHITE bg=DEFAULT_COLOR"
theme.styles.NUMB = "fg=WHITE bg=DEFAULT_COLOR"
theme.styles.STRG = "fg=WHITE bg=DEFAULT_COLOR bold=0"

apply_theme(theme)
