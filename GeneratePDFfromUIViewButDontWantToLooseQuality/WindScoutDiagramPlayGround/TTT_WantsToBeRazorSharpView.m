//
//  TTT_WantsToBeRazorSharpView.m
//
//  Copyright 2012 florianbachmann. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TTT_WantsToBeRazorSharpView.h"

@implementation TTT_WantsToBeRazorSharpView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self initValues];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
		[self initValues];
    }
    return self;
}

- (void)initValues {
    UIColor *gray = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    CALayer *l = [self layer];
    l.masksToBounds = YES;
    l.cornerRadius = 10.0f;
    l.borderWidth = 3.0f;
    self.backgroundColor = gray;
    l.borderColor = gray.CGColor;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"TTT_WantsToBeRazorSharpView drawRect[%3.2f,%3.2f][%3.2f,%3.2f]",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);

    // get the graphic context
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetShouldSmoothFonts(ctx,YES);

    CGColorRef colorWhite = CGColorRetain([UIColor whiteColor].CGColor);

	CGContextSetFillColorWithColor(ctx, colorWhite);

    CGContextSelectFont(ctx, "Helvetica-Bold", 24, kCGEncodingMacRoman);
    CGAffineTransform tranformer = CGAffineTransformMakeScale(1.0, -1.0);
    CGContextSetTextMatrix(ctx, tranformer);

    //why is this sucker blurry?
	NSString*txtPleaseHelp = NSLocalizedString(@"Hello, am I blurry again?",@"");
    CGContextShowTextAtPoint(ctx, 10, 50, [txtPleaseHelp cStringUsingEncoding:NSMacOSRomanStringEncoding], [txtPleaseHelp length]);
    CGColorRelease(colorWhite);
}

@end
