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

NSDictionary *pdfNamesDictionary;
NSMutableString *allnames;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PDF_links" ofType:@"plist"];
    pdfNamesDictionary = [[NSDictionary alloc] initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
    
//    for (NSString *str in pdfNamesDictionary){
//        NSLog(str);
//        NSLog([pdfNamesDictionary objectForKey:str]);
//    }
    
    [self.window setContentView:self.CMUGenView];
    NSString *generalKey = @"CMU General";
    NSString *str = [[NSBundle mainBundle] pathForResource:[[pdfNamesDictionary objectForKey:generalKey] stringByAppendingString:@".pdf"] ofType:nil];
    NSURL *url= [NSURL fileURLWithPath:str];
    PDFDocument *sheet = [[PDFDocument alloc] initWithURL:url];
    [self.cmuGenPdfView setScaleFactor:2.0];
    [self.cmuGenPdfView setDocument:sheet];
    
    [self.cmuGenPdfView
     setBackgroundColor:[NSColor colorWithCalibratedRed:.5 green:.05 blue:.04 alpha:1]];
    [self.pdfv setBackgroundColor:[NSColor colorWithCalibratedRed:.95 green:.96 blue:.97 alpha:1]];
    
    allnames=[[NSMutableString alloc] init];
    
    [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
    
    
}



- (IBAction)gotoGbook:(id)sender {
    [self.window setContentView:self.newview];
}

- (IBAction)goBack:(id)sender {
    [self.window setContentView:self.initialview];
}

- (IBAction)gotoGenInfo:(id)sender {
    [self.window setContentView:self.CMUGenView];
}

- (IBAction)seeGuestList:(id)sender {
    [self.guestListWindow makeKeyAndOrderFront:self];
    [self.gbookTView setString:allnames];
    
}

- (IBAction)submitGuestListEntry:(id)sender {
    NSString *name = self.gbookNameField.stringValue;
    NSString *emAddr = self.gbootAddField.stringValue;
    NSString *comments = self.gbookCommentField.stringValue;
    
    NSString *addition = [NSString stringWithFormat:@"Name:%@\r Email Address:%@\r Comments:%@\r",name,emAddr,comments];
    
    
    
    [allnames appendString:addition];
//    NSLog(allnames);

    
    self.gbookNameField.stringValue=@"";
    self.gbootAddField.stringValue=@"";
    self.gbookCommentField.stringValue=@"";
    
    
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
    [self setSheet:[pdfNamesDictionary objectForKey:@"MCS"]];
    
}

- (IBAction)CIT:(id)sender {
    self.pTitle.stringValue = @"College of Engineering";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CIT"]];

}

- (IBAction)DC:(id)sender {
    self.pTitle.stringValue = @"Dietrich College of Humanities and Social Sciences";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"Dietrich"]];
}

- (IBAction)is:(id)sender {
    self.pTitle.stringValue = @"Information Systems";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"Information Systems"]];
}

- (IBAction)TPR:(id)sender {
    self.pTitle.stringValue = @"Tepper School of Business";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"Tepper"]];
}

- (IBAction)SCS:(id)sender {
    self.pTitle.stringValue = @"School of Computer Science";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"SCS"]];
}

- (IBAction)CFAA:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Architecture";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CFA - School of Architecture"]];
}

- (IBAction)CFADr:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Drama";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CFA - School of Drama"]];
}

- (IBAction)CFADe:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Design";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CFA - School of Design"]];
}

- (IBAction)CFARt:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Art";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CFA - School of Art"]];
}

- (IBAction)CFAM:(id)sender {
    self.pTitle.stringValue = @"College of Fine Arts - School of Music";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"CFA - School of Music"]];
}

- (IBAction)BXA:(id)sender {
    self.pTitle.stringValue = @"BXA Interdisciplinary Programs";
    [self goToProgramView];
    [self setSheet:[pdfNamesDictionary objectForKey:@"BXA Programs"]];
}


@end
