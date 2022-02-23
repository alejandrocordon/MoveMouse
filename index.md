### Movemouse

Movemouse is a MacOS Application that moves the mouse based on <a href="https://gist.github.com/vorce/04e660526473beecdc3029cf7c5a761c">Vorce/Jerry </a> project. It uses <a href="https://developer.apple.com/documentation/coregraphics/cgevent">CGEvent</a> that defines an opaque type that represents a low-level hardware event.
  
Example:
  
```
  CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: point, mouseButton: CGMouseButton.left)?.post(tap: CGEventTapLocation.cghidEventTap)
  
```
  

### Usage

Don't forget to allow the app in settings security/accesilibity (each time you compile if you are using it directly from XCode)

![Allow MacOS security](security.png?raw=true "Security")



### Demo video

In the next **video** you can see a demo of how it works. 


<p align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/kFVdB7A_LPk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>


### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```


### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.


