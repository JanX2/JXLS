/*
 *  main.c
 *  DHxls
 *
 *  Created by David Hoerl on 10/29/08.
 *  Copyright 2008 David Hoerl. All rights reserved.
 *
 */

//#import <Cocoa/Cocoa.h>
//#import <App/Foundation.h>

//#undef __FRAMEWORK__

#import <DHxls/DHWorkBook.h>

int main (int argc, const char * argv[])	// NSDate
{
	NSAutoreleasePool	*pool;
	DHCell				*cell;
	
    pool = [NSAutoreleasePool new];
	
	DHWorkBook *dhWB = [DHWorkBook new];
	
	DHWorkSheet *dhWS = [dhWB workSheetWithName:@"SHEET1"];
	
	//[dhWS height:100 row:1];
	[dhWS width:10000 col:0 format:NULL];
	
	for(unsigned short idx=0; idx<10; ++idx) {
		cell = [dhWS label:[NSString stringWithFormat:@"Row %d", idx+1] row:idx col:0];
		if(idx & 1) {
			// prove we can get the cell reference later
			cell = [dhWS cell:idx col:0];
		}
		[cell horzAlign:HALIGN_LEFT];
		[cell indent:INDENT_0+idx];
	}
//	[dhWS merge:(NSRect){{10, 10}, {3, 3} }];
	
//	NSData *now = [NSDate date];
//	NSDate *then = [NSDate dateWithString:@"1899-01-01 12:00:00 +0000").
	
	for(unsigned short idx=0; idx<10; ++idx) {
		[dhWS number:3.1415f row:idx col:1 numberFormat:FMT_GENERAL+idx];
	}
	
	[dhWS width:30000 col:2 format:NULL];
	for(unsigned short idx=0; idx<7; ++idx) {
		cell = [dhWS label:@"Hello World" row:idx col:2];
		[cell horzAlign:HALIGN_GENERAL+idx];
	}
	
	[dhWS width:0xFFFF col:3 format:NULL];
	for(unsigned short idx=0; idx<4; ++idx) {
		[dhWS height:24 row:idx format:NULL];
		cell = [dhWS label:@"Hello World" row:idx col:3];
		[cell vertAlign:VALIGN_TOP+idx];
	}
	
	int fud = [dhWB writeFile:@"/tmp/foo.xls"];
	[dhWB release];

NSLog(@"OK - bye! fud=%d", fud);	
	[[NSWorkspace sharedWorkspace] openFile:@"/tmp/foo.xls" withApplication:@"Microsoft Excel" andDeactivate:YES];
	
	[pool drain];
}
