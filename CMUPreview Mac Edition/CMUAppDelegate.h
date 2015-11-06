//
//  CMUAppDelegate.h
//  CMUPreview Mac Edition
//
//  Created by Alexander Chai on 6/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface CMUAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *initialview;
@property (assign) IBOutlet NSView *newview;
@property (assign) IBOutlet NSTextField *pTitle;
@property (assign) IBOutlet NSView *CMUGenView;

@property (assign) IBOutlet PDFView *cmuGenPdfView;

@property (assign) IBOutlet PDFView *pdfv;
@property (assign) IBOutlet NSView *CmuProgramPDF;

- (IBAction)gotoGbook:(id)sender;
- (IBAction)goBack:(id)sender;
- (IBAction)gotoGenInfo:(id)sender;



- (IBAction)MCS:(id)sender;
- (IBAction)CIT:(id)sender;
- (IBAction)DC:(id)sender;
- (IBAction)is:(id)sender;
- (IBAction)TPR:(id)sender;
- (IBAction)SCS:(id)sender;
- (IBAction)CFAA:(id)sender;
- (IBAction)CFADr:(id)sender;
- (IBAction)CFADe:(id)sender;
- (IBAction)CFARt:(id)sender;
- (IBAction)CFAM:(id)sender;
- (IBAction)BXA:(id)sender;

@end
