-- based on https://www.chiquitoipsum.com/ javascript

CHIQUITO_ARRAY = {"fistro","torpedo","pecador","sexuarl","por la gloria de mi madre","diodeno","condemor","jarl","ese que llega","pupita","la caidita","te voy a borrar el cerito","al ataquerl","a wan","a peich","a gramenawer","no puedor","hasta luego Lucas","mamaar","apetecan","caballo blanco caballo negroorl","ese pedazo de","benemeritaar","te va a hasé pupitaa","de la pradera", "ese hombree", "quietooor", "qué dise usteer", "no te digo trigo por no llamarte Rodrigor", "está la cosa muy malar", "tiene musho peligro","ahorarr","diodenoo","amatomaa","me cago en tus muelas","llevame al sircoo", "papaar papaar", "se calle ustée", "va usté muy cargadoo"}
LATIN_ARRAY = {
    "sit amet", "consectetur", "adipisicing", "elit", "sed", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua", "enim", "ad", "minim", "veniam", "quis", "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex", "commodo", "consequat", "duis", "aute", "irure", "dolor", "reprehenderit", "voluptate", "velit", "esse", "cillum","occaecat", "qui", "officia",
    table.unpack(CHIQUITO_ARRAY)
};

function shuffle(tab, count)
    -- From http://lua-users.org/wiki/RandomSample
    n = #tab
    for i = 1, count or n do
        local j = math.random(i, n)
        tab[i], tab[j] = tab[j], tab[i]
    end

    return tab
end

function generateLine(wordsarr, firstLine, nwords)
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

    return table.concat(line, " ")
end

function generateParagraph(wordsarr, firstPar, nlines)
    nlines = nlines or math.random(5, 10)

    lines = { generateLine(wordsarr, firstPar) }

    for i = 2, nlines do 
        table.insert(lines, generateLine(wordsarr, false) .. '.')
    end

    return table.concat(lines, " ")
end

function generateFull(wordsarr, nparagraphs)
    nparagraphs = nparagraphs or 3

    pars = { generateParagraph(wordsarr, true) }
    for i = 2, nparagraphs do 
        table.insert(pars, generateParagraph(wordsarr, false))
    end

    return table.concat(pars, "\n\n")
end

function dump(o)
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

function usage()
    io.stderr:write(string.format("Usage: %s {chiquito|latin} nparagraphs [seed]\n", arg[0]))
end

function main()
    lang = arg[1] or 'chiquito'

    if lang == 'chiquito' then
        wordsarr = CHIQUITO_ARRAY
    elseif lang == 'latin' then
        wordsarr = LATIN_ARRAY
    else
        io.stderr:write("Incorrect language " .. lang .. ", available languages are chiquito and latin\n")
        usage()
        os.exit(1)
    end

    nparagraphs = tonumber(arg[2])

    if not nparagraphs then
        usage()
        os.exit(1)
    end

    seed = tonumber(arg[3])
    if seed then math.randomseed(seed) end

    print(generateFull(wordsarr, nparagraphs))
end

main()
