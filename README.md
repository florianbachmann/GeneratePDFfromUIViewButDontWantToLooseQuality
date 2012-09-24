Generate PDF from UIView by rendering looses quality iOS

==============================================

Hello I face the same problem as mentioned here: [http://stackoverflow.com/questions/7943351/generate-pdf-from-uiview-by-rendering-looses-quality-ios](http://stackoverflow.com/questions/7943351/generate-pdf-from-uiview-by-rendering-looses-quality-ios)

But to sum it up:
====
I have a custom UIView called ```TTT_WantsToBeRazorSharpView```.
This view does nothing, but draw a text with
```
NSString*txtPleaseHelp = NSLocalizedString(@"Hello, am I blurry again?",@"");
CGContextShowTextAtPoint(ctx, 10, 50, [txtPleaseHelp cStringUsingEncoding:NSMacOSRomanStringEncoding], [txtPleaseHelp length]);
```

Now the View is drawn three times to an UIViewController (one time in IB) and two times in code with these lines:
```
TTT_WantsToBeRazorSharpView *customViewSharp = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:CGRectMake(10,250, 300, 80)];
 [self.view addSubview:customViewSharp];


 TTT_WantsToBeRazorSharpView *customViewBlurryButIKnowWhy = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:CGRectMake(361.5, 251.5, 301.5, 80.5)];
 [self.view addSubview:customViewBlurryButIKnowWhy];
```

the first code drawn view is razorsharp, while the second isn't, but that is ok, because of rect's comma values (361.5, 251.5, 301.5, 80.5).

The this picture:
![See this picture](https://raw.github.com/florianbachmann/GeneratePDFfromUIViewButDontWantToLooseQuality/master/GeneratePDFfromUIViewButDontWantToLooseQuality_01.png)

But my problem is now, if I render the view into an pdf document it is blurry!
And don't know why, see here:
![blurry pdf](https://raw.github.com/florianbachmann/GeneratePDFfromUIViewButDontWantToLooseQuality/master/GeneratePDFfromUIViewButDontWantToLooseQuality_02.png)

and the PDF file itself Test.pdf
![See this pdf](https://raw.github.com/florianbachmann/GeneratePDFfromUIViewButDontWantToLooseQuality/master/Test.pdf)

and the lines to render:
```
//this is blurry, but why?
CGRect customFrame1 = CGRectMake(10,50, 300, 80);
TTT_WantsToBeRazorSharpView *customViewSharp = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:customFrame1];
CGContextSaveGState(context);
CGContextSetTextMatrix(context, CGAffineTransformIdentity);
CGContextTranslateCTM(context, (int)customFrame1.origin.x, (int)customFrame1.origin.y);
[customViewSharp.layer renderInContext:context];
CGContextRestoreGState(context);
```


