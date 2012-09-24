//
//  TTT_PDFGenerator
//
//  Copyright 2012 timtomtam.de. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TTT_PDFGenerator : NSObject
@property(nonatomic, copy) NSString *pdfFileNameFullPath;

- (NSString*)generatePdfWithFilePath;

@end