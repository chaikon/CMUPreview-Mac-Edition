//
//  CMUAppDelegate.m
//  CMUPreview Mac Edition
//
//  Created by Alexander Chai on 6/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CMUAppDelegate.h"

@implementation CMUAppDelegate

@synthesize window = _window;
@synthesize initialview = _initialview;
@synthesize newview = _newview;
@synthesize CMUGenView = _CMUGenView;
@synthesize pTitle = _pTitle;

- (void)dealloc
{
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.window setContentView:self.CMUGenView];
    NSString *str = [[NSBundle mainBundle] pathForResource:@"CMUG.pdf" ofType:nil];
    NSURL *url= [NSURL fileURLWithPath:str];
    PDFDocument *sheet = [[PDFDocument alloc] initWithURL:url];
    [self.cmuGenPdfView setScaleFactor:2.0];
    [self.cmuGenPdfView setDocument:sheet];
}



- (IBAction)gotoGbook:(id)sender {
    [self.window setContentView:self.newview];
}

- (IBAction)goBack:(id)sender {
    [self.window setContentView:self.initialview];
}

- (IBAction)gotoGenInfo:(id)sender {
    [self.window setContentView:self.CMUGenView
     ];
}

-(void)goToProgramView{
    [self.window setContentView:self.CmuProgramPDF];
}

-(void)setSheet:(NSString *)sheetName{
    NSString *str = [[NSBundle mainBundle] pathForResource:[sheetName stringByAppendingString:@".pdf"] ofType:nil];
    NSURL *url= [NSURL fileURLWithPath:str];
    PDFDocument *sheet = [[PDFDocument alloc] initWithURL:url];
    [self.pdfv setScaleFactor:2.0];

    [self.pdfv setDocument:sheet];
}

- (IBAction)MCS:(id)sender {
    self.pTitle.stringValue = @"Mellon College of Science";
    [self goToProgramView];
    [self setSheet:@"MCSS"];
    
}

- (IBAction)CIT:(id)sender {
    self.pTitle.stringValue = @"College of Engineering";
    [self goToProgramView];
    [self setSheet:@"CITS"];

}

- (IBAction)DC:(id)sender {
    self.pTitle.stringValue = @"Dietrich College of Humanities and Social Sciences";
    [self goToProgramView];
    [self setSheet:@"DCS"];
}

- (IBAction)is:(id)sender {
    self.pTitle.stringValue = @"Information Systems";
    [self goToProgramView];
    [self setSheet:@"ISS"];
}

- (IBAction)TPR:(id)sender {
    self.pTitle.stringValue = @"Tepper School of Business";
    [self goToProgramView];
    [self setSheet:@"TEPS"];
}

- (IBAction)SCS:(id)sender {
    self.pTitle.stringValue = @"School of Computer Science";
    [self goToProgramView];
    [self setSheet:@"SCSS"];
}

- (IBAction)CFAA:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Architecture";
    [self goToProgramView];
    [self setSheet:@"ArchS"];
}

- (IBAction)CFADr:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Drama";
    [self goToProgramView];
    [self setSheet:@"DramS"];
}

- (IBAction)CFADe:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Design";
    [self goToProgramView];
    [self setSheet:@"DesignS"];
}

- (IBAction)CFARt:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Art";
    [self goToProgramView];
    [self setSheet:@"ArtS"];
}

- (IBAction)CFAM:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Music";
    [self goToProgramView];
    [self setSheet:@"MusicS"];
}

- (IBAction)BXA:(id)sender {
    self.pTitle.stringValue = @"BXA Interdisciplinary Programs";
    [self goToProgramView];
    [self setSheet:@"BXAS"];
}


@end
