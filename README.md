# VisionOS app game development 101 (2D view, Immersive Space, tappable 3D objects, WindowGroup)

![english-article-thumbnail](https://github.com/user-attachments/assets/b75fb336-b48f-4786-8207-c276fa12d51e)

Learn how to develop app for VisionOS Apple Vision Pro, including displaying 3D .usdz assets, showing immersive space, detect tap on the 3D entity. Using RealityKit and SwiftUI.

If you follow through this article, you can learn to make a mini game that shows robot in random location in the room and you can tap it to hide it

![rack-a-bot-game.gif](https://article-images.mszpro.com/rack-a-bot-game-compressed.gif)

![Simulator Screenshot - Apple Vision Pro - 2024-08-21 at 21 42 37](https://github.com/user-attachments/assets/44dc76f9-a424-4ff6-87d5-0e8f38068190)

## Article links

Tutorial on Youtube: https://youtu.be/6gDu80Jbnwo

Article in English: https://mszpro.com/blog/blog-article-visionos-dev-101/

On Medium: https://medium.com/@MszPro/visionos-app-game-dev-101-2d-view-immersive-space-tappable-3d-objects-windowgroup-a714f2006098

In Japanese: https://qiita.com/mashunzhe/items/1ed5f909f2bdd2b1d4c2

## This article talks about:
- Adding VisionOS target to your existing app
- Toggle the transparency of the view background
- Conditionally run code for VisionOS app only
- Load 3D asset (a .usdz file) using asset bundle
- Open an immersive space to display the 3D asset alongside 2D view
- Open a new window displaying the 3D asset, and allow user hand control to rotate and zoom the model
- Change the position, scale of the 3D asset
- Apply animation to the 3D asset
- Close the immersive space
- Allow using pinch and eye to select object
- This article has been recorded by me as a Youtube video (but in English)
