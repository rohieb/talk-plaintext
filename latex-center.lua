-- wrap Divs with class .center into a RawBlock containing a LaTeX center
-- environment

local List = require 'pandoc.List'

function Div(el)       return center_block(el) end

function center_block(el)
	if (el.classes:find("center", 1) ~= nil) then
		return	pandoc.Div {
			  pandoc.RawBlock("latex", "\\begin{center}"),
			  el,
			  pandoc.RawBlock ("latex", "\\end{center}")
			}
        end
end
