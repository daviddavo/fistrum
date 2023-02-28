#!/usr/bin/env texlua
module     = "fistrum"
pkgversion = "0.1"
pkgdate    = os.date("%Y-%m-%d")

dofile("config-pdftex.lua")

checkconfigs =
  {
    "config-pdftex.lua"
  , "config-tutex.lua"
  }

-- Tagging:
tagfiles = { "fistrum.dtx", "CHANGELOG.md" }
function update_tag(file, content, tagname, tagdate)
  if tagname == nil then
    tagname = pkgversion
    tagdate = pkgdate
  end
  local function tagstring(find, replace)
    if string.match(content, find .. "\n") then
      content = string.gsub(content, find .. "\n", replace .. "\n")
    end
  end
  tagstring(
    "\\def\\fistrumversion{%d+%.%d+%w?}",
    "\\def\\fistrumversion{" .. tagname .. "}")
  tagstring(
    "\\def\\fistrumdate{%d+-%d+-%d+}",
    "\\def\\fistrumdate{" .. tagdate .. "}")
  tagstring(
    "\\date{\\DTMdate{%d+-%d+-%d+}}",
    "\\date{\\DTMdate{"..tagdate.."}}")
  tagstring(
    "## %[Unreleased%]",
    "## [" .. tagname .. "]")
  return content
end

function check_engines() end
