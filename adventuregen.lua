htmltemplate = [===[
<!DOCTYPE html>
<html>
<head>
    <title>Story</title>
    <meta charset="utf-8">
    <style>
        div.storypage {
            display: none;
        }

        div.storypage:target {
            display: inline;
        }

    </style>
</head>
<body>
%s
</body>
</html>
]===]


local allpages = {}

function page(pagename)
    return function(pagedata)
        local name = ("    <div id='%s' class='storypage'>"):format(pagename)
        local title = ("        <h1>%s</h1>"):format(pagedata.title)
        local text = ("        <p>%s</p>"):format(pagedata.text)
        local choices

        if pagedata.choices then
            choices = {'        <ol>'}
            for i,v in pairs(pagedata.choices) do
                table.insert(choices, ("            <li><a href='#%s'>%s</a></li>"):format(i, v))
            end
            table.insert(choices, '        </ol>')
            choices = table.concat(choices, '\n')
        else
            choices = '        The end.'
        end

        local ending = "    </div>"
        table.insert(allpages, table.concat({name, title, text, choices, ending}, '\n'))
    end
end

if #arg == 0 then
    io.stderr:write(("Usage: %s story.lua"):format(arg[0]))
    return 1
end

dofile(arg[1])
print(htmltemplate:format(table.concat(allpages, '\n\n')))
