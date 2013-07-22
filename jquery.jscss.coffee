###
jquery.jscss.js

Copyright 2013, Acatl Pacheco
Licensed under the MIT License.

@WIP  

###

jscss = (classes)->
    parseClass = (classes, parentClass="",output = []) ->
        for selector, Class of classes
            styles = ""
            concat = if selector.indexOf("&") is 0 then "" else " "
            selector = parentClass + concat + selector.replace("&", "") 
            nestedClasses = []
            for styleName, styleVal of Class
                if typeof styleVal is "object"
                    nestedClass = {}
                    nestedClass[styleName] = styleVal
                    innerClasses = parseClass(nestedClass,selector)
                    nestedClasses = nestedClasses.concat innerClasses
                    continue
                styles+= "#{styleName} : #{styleVal}; "

            output.push "#{selector} { #{styles} }\n" if styles isnt ""
            output = output.concat nestedClasses
        output

    output = parseClass(classes).join("")
    output