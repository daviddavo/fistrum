#!/usr/bin/env texlua
-- based on https://www.chiquitoipsum.com/ javascript
local G = {}

G.CHIQUITO_ARRAY = {"fistro","torpedo","pecador","sexuarl","por la gloria de mi madre","diodeno","condemor","jarl","ese que llega","pupita","la caidita","te voy a borrar el cerito","al ataquerl","a wan","a peich","a gramenawer","no puedor","hasta luego Lucas","mamaar","apetecan","caballo blanco caballo negroorl","ese pedazo de","benemeritaar","te va a hasé pupitaa","de la pradera", "ese hombree", "quietooor", "qué dise usteer", "no te digo trigo por no llamarte Rodrigor", "está la cosa muy malar", "tiene musho peligro","ahorarr","diodenoo","amatomaa","me cago en tus muelas","llevame al sircoo", "papaar papaar", "se calle ustée", "va usté muy cargadoo"}
G.LATIN_ARRAY = {
    "sit amet", "consectetur", "adipisicing", "elit", "sed", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua", "enim", "ad", "minim", "veniam", "quis", "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex", "commodo", "consequat", "duis", "aute", "irure", "dolor", "reprehenderit", "voluptate", "velit", "esse", "cillum","occaecat", "qui", "officia",
    table.unpack(G.CHIQUITO_ARRAY)
};

local function shuffle(tab, count)
    -- From http://lua-users.org/wiki/RandomSample
    n = #tab
    for i = 1, count or n do
        local j = math.random(i, n)
        tab[i], tab[j] = tab[j], tab[i]
    end

    return tab
end

function G.generateLine(wordsarr, firstLine, nwords)
    line = {}
    nwords = nwords or math.random(4, 12)

    if firstLine then
        table.insert(line, "Lorem fistrum")
        nwords = nwords - 1
    end

    for k, w in pairs(shuffle(wordsarr, nwords)) do
        table.insert(line, w)
        nwords = nwords - 1

        if nwords <= 0 then break end
    end

    -- Convert first letter to uppercase
    -- https://stackoverflow.com/a/2421746/4505998
    -- Parenthesis are needed, idk
    -- https://stackoverflow.com/a/41537878/4505998
    return (table.concat(line, " "):gsub("^%l", string.upper))
end

function G.generateParagraph(wordsarr, firstPar, nlines)
    nlines = nlines or math.random(5, 10)

    lines = { G.generateLine(wordsarr, firstPar) }

    for i = 2, nlines do 
        table.insert(lines, G.generateLine(wordsarr, false))
    end

    return table.concat(lines, ". ").."."
end

function G.generateFull(wordsarr, nparagraphs)
    nparagraphs = nparagraphs or 3

    pars = { G.generateParagraph(wordsarr, true) }
    for i = 2, nparagraphs do 
        table.insert(pars, G.generateParagraph(wordsarr, false))
    end

    return table.concat(pars, "\n\n")
end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return G
