//
//  AppDelegate.m
//  TextDHxls
//
//  Created by David Hoerl on 3/5/13.
//  Copyright (c) 2013 David Hoerl. All rights reserved.
//

#import "AppDelegate.h"

//#import "AppDelegate.h"
#import <DHxls/DHWorkBook.h>


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	[self myTest];
}

- (void)myTest
{
	DHCell				*cell;
		
	DHWorkBook *dhWB = [DHWorkBook new];
	
	DHWorkSheet *dhWS = [dhWB workSheetWithName:@"SHEET1"];
	
	//[dhWS height:100 row:1];
	[dhWS setWidth:10000 forColumn:0 defaultFormat:NULL];
	
	for(uint32_t idx=0; idx<10; ++idx) {
		cell = [dhWS setCellAtRow:idx column:0 toString:[NSString stringWithFormat:@"Row %d", idx + 1]];
		if(idx & 1) {
			// prove we can get the cell reference later
			cell = [dhWS cellAtRow:idx col:0];
		}
		[cell setHorizontalAlignment:HALIGN_LEFT];
		[cell setIndentation:INDENT_0 + idx];
	}
//	[dhWS merge:(NSRect){{10, 10}, {3, 3} }];
	
//	NSData *now = [NSDate date];
//	NSDate *then = [NSDate dateWithString:@"1899-01-01 12:00:00 +0000").
	
	for(uint32_t idx=0; idx<10; ++idx) {
		[dhWS setCellAtRow:idx column:1 toDoubleValue:3.1415f withNumberFormat:FMT_GENERAL + idx];
	}

	[dhWS setWidth:30000 forColumn:2 defaultFormat:NULL];
	for(uint32_t idx=0; idx<7; ++idx) {
		cell = [dhWS setCellAtRow:idx column:2 toString:@"Hello World"];
		[cell setHorizontalAlignment:HALIGN_GENERAL + idx];
	}

	[dhWS setWidth:0xFFFF forColumn:3 defaultFormat:NULL];
	for(uint32_t idx=0; idx<4; ++idx) {
		[dhWS setHeight:24 forRow:idx defaultFormat:NULL];
		cell = [dhWS setCellAtRow:idx column:3 toString:@"Hello World"];
		[cell setVerticalAlignment:VALIGN_TOP + idx];
	}
	
	int fud = [dhWB writeToFile:@"foo.xls"];

NSLog(@"OK - bye! fud=%d", fud);
	NSString *xlsApp = nil;//@"Microsoft Excel";
	[[NSWorkspace sharedWorkspace] openFile:@"foo.xls" withApplication:xlsApp andDeactivate:YES];
}

@end

