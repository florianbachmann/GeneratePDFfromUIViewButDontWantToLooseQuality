//
//  TTT_ViewController.m
//
//  Copyright (c) 2012 florianbachmann. All rights reserved.
//

#import "TTT_ViewController.h"
#import "TTT_WantsToBeRazorSharpView.h"
#import "TTT_PDFGenerator.h"

@implementation TTT_ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    TTT_WantsToBeRazorSharpView *customViewSharp = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:CGRectMake(10,250, 300, 80)];
    [self.view addSubview:customViewSharp];


    TTT_WantsToBeRazorSharpView *customViewBlurryButIKnowWhy = [[TTT_WantsToBeRazorSharpView alloc] initWithFrame:CGRectMake(361.5, 251.5, 301.5, 80.5)];
    [self.view addSubview:customViewBlurryButIKnowWhy];

    [self saveAsPDFAction:nil];
}


- (IBAction)saveAsPDFAction:(id)sender {
    NSLog(@"saveAsPDFAction");
    TTT_PDFGenerator *pdf = [[TTT_PDFGenerator alloc] init];
    NSString *pdfFileName = [pdf generatePdfWithFilePath];
    NSLog(@"generatePdfButtonPressed %@",pdfFileName);
   
    NSURL *url = [NSURL fileURLWithPath:pdfFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   // [self.webViewToShowPDF setScalesPageToFit:YES];
    [self.webViewToShowPDF loadRequest:request];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (UIInterfaceOrientationIsLandscape(toInterfaceOrientation));
}


@end
