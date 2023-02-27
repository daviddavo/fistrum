#!/usr/bin/env texlua
G = require('generator')

local function usage()
    io.stderr:write(string.format("Usage: %s {chiquito|latin} nparagraphs [seed]\n", arg[0]))
end

local function main()
    lang = arg[1] or 'chiquito'

    if lang == 'chiquito' then
        wordsarr = G.CHIQUITO_ARRAY
    elseif lang == 'latin' then
        wordsarr = G.LATIN_ARRAY
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

    print(G.generateFull(wordsarr, nparagraphs))
end

main()
