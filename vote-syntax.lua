function Div(elem)
    if elem.classes:find("vote", 1) then
        local first_para = pandoc.utils.stringify(elem.content[1])
        local subject, pro, contra, neutral = string.match(first_para, "(.*) %((%d+)|(%d+)|(%d+)%)")
        return {
            pandoc.Para { pandoc.Str(("Abstimmung: " .. subject)) },
            pandoc.Para { pandoc.Str(("Pro: %s, Contra: %s, Enthaltung: %s"):format(pro, contra, neutral)) },
            elem.content[2]
        }
    end
end

-- vim: ts=4 sw=4 et
