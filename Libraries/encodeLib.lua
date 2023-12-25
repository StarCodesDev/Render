-- Render Custom Vape Signed File
local encodeLib = {}
local lower = {
    a = '$',
    b = '|',
    c = '@',
    d = '*',
    e = '(',
    f = ')',
    g = '-',
    h = '_',
    i = '/',
    j = '+',
    k = '{',
    l = '}', 
    m = ']',
    n = '[',
    o = '!',
    p = '^',
    q = '=',
    r = '&',
    s = '~',
    t = '.',
    u = '?',
    v = '#',
    w = '`',
    x = ',',
    y = ':',
    z = ';'
}

encodeLib.encode = function(text)
    text = tostring(text) 
    for i = 1, #text do 
        local char = text:sub(i, i):lower()
        if lower[char] then 
            text = text:lower():gsub(char, lower[char])
        end
    end 
    return text
end

local function replacechar(str, char, pos)
    local newtext = str
    for i = 1, #str do 
        if i == pos then 
            local text = str:sub(i - 1, i - 1)
            local otherchars = str:sub(i, #str)
            newtext = ((text)..char..(otherchars))
        end
    end
    return newtext
end

encodeLib.decode = function(text)
    local newtext = ''
    text = tostring(text)
    for i = 1, #text do
        local char = text:sub(i, i)
        for i2, v in next, lower do 
            if v == char then 
                newtext = (newtext..(i2))
            end
        end 
    end
    return newtext
end

return encodeLib
