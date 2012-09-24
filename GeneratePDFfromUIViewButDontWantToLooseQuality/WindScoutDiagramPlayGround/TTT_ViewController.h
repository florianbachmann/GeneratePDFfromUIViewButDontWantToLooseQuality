//
//  TTT_ViewController.h
//
//  Copyright (c) 2012 florianbachmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTT_ViewController : UIViewController
- (IBAction)saveAsPDFAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webViewToShowPDF;
@end
