<h1 style="text-align:center">Markdown Customization with HTML/CSS</h1>

## Markdown is HTML
| Markdown | #,...,###### | paragraph | `[]()` | `![]()` |
|:---:|:---:|:---:|:---:|:---:|
| HTML Tags | h1,...,h6 | p | a | img |

## Text Alignment/Centering
```HTML
<!-- centering title -->
<h1 style="text-align:center">Markdown Customization</h1>
<!-- align text -->
<p style="text-align:center">Center text</p>
<p style="text-align:Right">Right text</p>
```
<p style="text-align:center">Center text</p>
<p style="text-align:Right">Right text</p>

## Font
### Size and Color
```HTML
<span style="font-size:2rem; color: red">2 rem red text</span>
<p style="font-size:15px;">15px paragraph</p>
```
<span style="font-size:2rem; color: red">2 rem red text</span>
<p style="font-size:15px;">15px paragraph</p>

**Note**: `p` and `span` both works for texts. The difference is, `p` means a paragraph with new line, while `span` is just a text wrapper and `span` does not support `text-align` option.

### Length Unit in CSS
There are many ways to describe size in css,
- Absolute
    - px(pixels), cm, mm, in, pt(1/72 inch), pc(12pt)
- Relative (Strongly Recommended)
    - em:   Relative to the font-size of the element
    - rem:  Relative to font-size of the root element
    - vw:   Relative to 1% of the width of the viewport
    - vh:   Relative to 1% of the height of the viewport*
    - 50%:  Relative to 50% of parent element

### More on Font Style
HTML tags can be nested `*`, `**`, `***`, however the color will be overrided to black, so we prefer a pure css solution.
```
<span style="
    font-weight: bold; 
    font-style: italic;
    text-decoration: underline;">
    A bold and italic text with underline
</span>
```
<span style="
    font-weight: bold; 
    font-style: italic;
    text-decoration: underline;">A bold and italic text with underline</span>

## Space and empty line
`<br> new line`<br>New line&emsp;`&emsp 4 space`&ensp;`&ensp 2 space`&nbsp;`&nbsp; 1 space`

## Table
HTML table tags like `tr` `td` are compatible with Markdown, but writing them by hand is time-consuming. I suggest generate html code from [https://www.tablesgenerator.com/html_tables](https://www.tablesgenerator.com/html_tables) if you need complex table format

## Images Style
### Absolute Size
```HTML
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" width=400 height=100/>
```
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" width=400 height=100/>

### Relative Size
Set image width relative to page width, then use `aspect-ratio` to lock the ratio of width and height. Note this only works on modern browser.
```HTML
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" style="width: 10%; aspect-ratio: 4 / 3;"/>
```
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" style="width: 10%; aspect-ratio: 4 / 3;"/>

### Alternative text
```HTML
<img src="https://www.bing.com/" style="width: 10%; aspect-ratio: 4 / 3;" alt="broken image">
```

<img src="https://www.bing.com/" style="width: 10%; aspect-ratio: 4 / 3;" alt="broken image">

### Centering
When using `img` tag, `centering` tag of markdown does not work any more, so we need to define a bit more css.
```HTML
<img 
  src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png"
  style="display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%; aspect-ratio: 16 / 9;"
/>
```
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png"
  style="display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%; aspect-ratio: 16/9;"
/>

**For more techniques on image formating and multiple image stacking, please read [this blog](https://stackoverflow.com/questions/12090472/how-do-i-center-an-image-in-the-readme-md-file-on-github)**.

## Complex Layout (Might Failed in Rmarkdown)
This is rather similar to writing native HTML/CSS. We can re-organized the text and image by carefully designing the position and flex layout (for more on flex layout, please see [this tutorial](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)). However, this is usually not necessary so we only raise an example here.

In addition, sometimes we can add `<div></div>` tags to wrap up some elements so that we configure their layout together by css. This is simliar to what `span` tag is dong.

Here is an example of putting text on the right and image on the left
```HTML
<!-- Remove "flex-direction: row-reverse" if you want the text to be on the left -->
<div style="display: flex; flex-direction: row-reverse">
    <p style="width:40%">...</p>
    <img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" 
        style="width: 60%; aspect-ratio: 16 / 9;"/>
</div>
```

<div style="display: flex; flex-direction: row-reverse">
<p style="width:40%">Some text <br/>Deo suspicio vos deinceps figmenta dumtaxat ulterius ens. Scripturis has uno quaerantur accidentia est eos. Ibi quo idea ergo otii dico dat quas fuit. Sap habetur ineptum has objecta fas. Dem indubitati distinguit diversorum lus imo. Est hic quae quos puto dare qua. Ut eo possimus insomnia me lectione actualis occurrit deceptor vi. Purgantur im ex fruebatur clausulas examinare finguntur re. Difficilia blandisque se mo ostenditur. Ac gi is tam nihilo partes.</p>
<img src="https://krisrs1128.github.io/LSLab/assets/img/lakes.png" style="width: 60%; aspect-ratio: 16 / 9;"/>
</div>
