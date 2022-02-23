### Movemouse

Movemouse is a MacOS Application that moves the mouse based on <a href="https://gist.github.com/vorce/04e660526473beecdc3029cf7c5a761c">Vorce/Jerry </a> project. It uses <a href="https://developer.apple.com/documentation/coregraphics/cgevent">CGEvent</a> that defines an opaque type that represents a low-level hardware event.
It ofers a simple interface to randomly move the mouse across the screen.
  
  
  ![Interface](https://user-images.githubusercontent.com/971703/155319693-f76b412f-38f6-4e97-9cac-43fe50e20472.png)


Movemouse is MacOS 11.4 Big Sur or later compatible.

  
Code example:
  

  
  ```
This following code is used to **move** the mouse from one point to another.

  `CGEvent(mouseEventSource: nil, 
          mouseType: CGEventType.mouseMoved, 
          mouseCursorPosition: point, 
          mouseButton: CGMouseButton.left)?.post(tap: CGEventTapLocation.cghidEventTap)`
  

It can be uset also to **click** in some points of the screen using the next function:

  `
  CGEvent(mouseEventSource: nil, 
          mouseType: CGEventType.leftMouseUp, 
          mouseCursorPosition: point, 
          mouseButton: mouseButton)?.post(tap: CGEventTapLocation.cghidEventTap)
  `

```
 
 
  

### Usage

Don't forget to allow the app in settings security/accesilibity (each time you compile if you are using it directly from XCode)

![Allow MacOS security](security.png?raw=true "Security")



### Demo video

In the next **video** you can see a demo of how it works. 


<p align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/kFVdB7A_LPk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>


### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.


