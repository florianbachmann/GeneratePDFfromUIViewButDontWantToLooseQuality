//
//  TTT_PDFGenerator
//
//  Copyright 2012 timtomtam.de. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TTT_PDFGenerator.h"
#import "TTT_WantsToBeRazorSharpView.h"


@implementation TTT_PDFGenerator {
    CGSize _pageSizeA4;
    CGRect _sizeBounds;

}

- (id)init {
    self = [super init];
    if (self) {
        NSString *pdfFileName = @"Test.pdf";
        NSString *pdfFileNamePath = NSTemporaryDirectory();
        self.pdfFileNameFullPath = [pdfFileNamePath stringByAppendingPathComponent:pdfFileName];
        NSLog(@"pdfWithDefaultPath - generatePdfButtonPressed %@", _pdfFileNameFullPath);
    }
    return self;
}

- (NSString*)generatePdfWithFilePath {
    _pageSizeA4 = CGSizeMake(350,350); //not quite DIN A4
    _sizeBounds = CGRectMake(0, 0, _pageSizeA4.width, _pageSizeA4.height);

    UIGraphicsBeginPDFContextToFile(self.pdfFileNameFullPath, _sizeBounds, nil);

    UIGraphicsBeginPDFPageWithInfo(_sizeBounds, nil);

    //super sharp
    [self drawText:@"This is my problem:" atPoint:CGPointMake(10, 10)];
    [self drawText:@"Now both Custom Views are blurry:" atPoint:CGPointMake(10, 30)];


    CGContextRef context = UIGraphicsGetCurrentContext();


    //this is blurry, but why?
    CGRect customFrame1 = CGRectMake(10,50, 300, 80);
    TTT_WantsToBeRazorSharpView *customViewSharp = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:customFrame1];
    CGContextSaveGState(context);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, (int)customFrame1.origin.x, (int)customFrame1.origin.y);
    [customViewSharp.layer renderInContext:context];
    CGContextRestoreGState(context);

    //it is still blurry, as expected
    CGRect customFrame2 = CGRectMake(10.5, 150.5, 301.5, 80.5);
    TTT_WantsToBeRazorSharpView *customViewBlurryButIKnowWhy = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:customFrame2];
    CGContextSaveGState(context);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, (int)customFrame2.origin.x, (int)customFrame2.origin.y);
    [customViewBlurryButIKnowWhy.layer renderInContext:context];
    CGContextRestoreGState(context);

    UIGraphicsEndPDFContext();
    return _pdfFileNameFullPath;
}

//produces razor sharp text
- (void)drawText:(NSString *)text atPoint:(CGPoint)point {
    UIFont* font = [UIFont fontWithName: @"Helvetica-Bold" size: 18];
    CGSize contentSize = [text sizeWithFont:font constrainedToSize:_pageSizeA4 lineBreakMode:NSLineBreakByWordWrapping];
    CGRect textRect = CGRectMake(point.x, point.y, contentSize.width, contentSize.height);
    [[UIColor blackColor] setFill];
    [text drawInRect:textRect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
}

@end