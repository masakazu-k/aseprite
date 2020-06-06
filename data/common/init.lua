local function cwd()
    -- Get Current Working Directory
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*[/\\])")
end

local function homed()
    -- Get Aseprite Home Direcotry
    local str = os.getenv("APPDATA")
    if str == nil then
        str = os.getenv("HOME") 
    end
    return str .. "/Aseprite/"
end

-- Add Search Path For require()
package.path = package.path .. ";"
    -- Add common dir
    .. cwd() .. "common/?.lua;"
    -- Add aseprite home dir
    .. homed() .. "?.lua;"
    -- Add aseprite scripts home dir
    .. homed() .. "scripts/?.lua;"
    -- EX?) Add aseprite modules home dir
    .. homed() .. "modules/?.lua;"

-- Activate Remote Debugger
-- If you want to activate debug mode by lua script,
-- You MUST add lrdb_server.dll or lrdb_server.so to data/common directory.
-- require("lrdb_server")
-- lrdb.activate(21110)
