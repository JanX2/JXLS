//
//  ViewController.m
//  TestJXLSiOS
//
//  Created by David Hoerl on 3/8/13.
//  Copyright (c) 2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import <JXLS/JXLS.h>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self myTest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myTest
{
	NSString *filePath = @"/tmp/foo.xls";
	
	JXLSCell				*cell;
		
	JXLSWorkBook *workBook = [JXLSWorkBook new];
	
	JXLSWorkSheet *workSheet = [workBook workSheetWithName:@"SHEET1"];
	
	//[workSheet setHeight:100 forRow:1 defaultFormat:NULL];
	[workSheet setWidth:10000 forColumn:0 defaultFormat:NULL];
	
	for(uint32_t idx=0; idx<10; ++idx) {
		cell = [workSheet setCellAtRow:idx column:0 toString:[NSString stringWithFormat:@"Row %d", idx + 1]];
		if(idx & 1) {
			// prove we can get the cell reference later
			cell = [workSheet cellAtRow:idx col:0];
		}
		[cell setHorizontalAlignment:HALIGN_LEFT];
		[cell setIndentation:INDENT_0 + idx];
	}
//	[workSheet mergeCellsInRect:(NSRect){{10, 10}, {3, 3}}];
	
//	NSData *now = [NSDate date];
//	NSDate *then = [NSDate dateWithString:@"1899-01-01 12:00:00 +0000").
	
	for(uint32_t idx=0; idx<10; ++idx) {
		[workSheet setCellAtRow:idx column:1 toDoubleValue:3.1415f withNumberFormat:FMT_GENERAL + idx];
	}

	[workSheet setWidth:30000 forColumn:2 defaultFormat:NULL];
	for(uint32_t idx=0; idx<7; ++idx) {
		cell = [workSheet setCellAtRow:idx column:2 toString:@"Hello World"];
		[cell setHorizontalAlignment:HALIGN_GENERAL + idx];
	}

	[workSheet setWidth:0xFFFF forColumn:3 defaultFormat:NULL];
	for(uint32_t idx=0; idx<4; ++idx) {
		[workSheet setHeight:24 forRow:idx defaultFormat:NULL];
		cell = [workSheet setCellAtRow:idx column:3 toString:@"Hello World"];
		[cell setVerticalAlignment:VALIGN_TOP + idx];
	}
	
	int fud = [workBook writeToFile:filePath];
	
	NSLog(@"OK - bye! fud=%d", fud);
}

@end
