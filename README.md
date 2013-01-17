jquery.jscss
============

parse json into css, supports nesting

**Work in progress**

testing @ [http://jsfiddle.net/acatl/XA3YF/](http://jsfiddle.net/acatl/XA3YF/)

Example json input

```coffee
var classes;

classes = {
  "div": {
    "background": "red"
  },
  "body": {
    "div": {
      "color": "red"
    },
    "padding": "0 0 10 0",
    ".nested": {
      ".part-nested": {
        "color": "blue",
        ".deeper": {
          "border": "1px solid"
        },
        "&#id-worng-use": {
          "color": "yellow"
        }
      }
    },
    "a": {
      "color": "red",
      "&:hover": {
        "color": "green"
      },
      "&.is-disabled": {
        "color": "blue"
      }
    },
    "margin": "0 0 10 0"
  }
};
```

Output        

```css
div { background : red;  }
body { padding : 0 0 10 0; margin : 0 0 10 0;  }
body div { color : red;  }
body .nested .part-nested { color : blue;  }
body .nested .part-nested .deeper { border : 1px solid;  }
body .nested .part-nested#id { color : yellow;  }
body a { color : red;  }
body a:hover { color : green;  }
body a.is-disabled { color : blue;  }
```