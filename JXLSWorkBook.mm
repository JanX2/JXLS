//
//  JXLSWorkBook.m
//  JXLS
//
//  Created by David Hoerl on 10/6/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#include "globalrec.h"
#include "workbook.h"
#include "sheetrec.h"
#include "font.h"
#include "format.h"
#include "extformat.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "JXLSWorkBook.h"

#import "JXLSWorkSheet.h"
#import "JXLSFont.h"
#import "JXLSFormat.h"
#import "JXLSExtendedFormat.h"


@implementation JXLSWorkBook
{
	xlslib_core::workbook		*_workBook;
	NSMutableArray				*_workSheets;
}

- (instancetype)init
{
	self = [super init];
	
	// only time we actually allocate a C++ object
	_workBook = new workbook;
	
	_workSheets = [NSMutableArray arrayWithCapacity:3];
	
	return self;
}
- (void)dealloc
{
	delete _workBook;
}

- (JXLSWorkSheet *)workSheetWithName:(NSString *)name
{
	JXLSWorkSheet		*aWorkSheet;
	worksheet			*ws;
	ustring				uniStr;
	
	@autoreleasepool {
		unichar *uniName = (unichar *)[name cStringUsingEncoding:NSUnicodeStringEncoding];
		uniStr.assign(uniName);
	}
	
	ws = _workBook->sheet(uniStr);
	
	aWorkSheet = [[JXLSWorkSheet alloc] initWithWorkSheet:ws];
	[_workSheets addObject:aWorkSheet];
	
	return aWorkSheet;
}
- (JXLSWorkSheet *)workSheetForOffset:(uint16_t)offset
{
	if([_workSheets count] < offset) {
		return nil;
	}
	return [_workSheets objectAtIndex:offset];
}
- (JXLSFont *)fontWithName:(NSString *)name
{	
	JXLSFont			*aFont;
	font_t				*ft;
	
	ft = _workBook->font([name cStringUsingEncoding:NSASCIIStringEncoding]);

	aFont = [[JXLSFont alloc] initWithFont:ft];
	
	return aFont;
}
- (JXLSFormat *)formatWithString:(NSString *)name
{
	JXLSFormat			*format;
	format_t			*ft;
	ustring				uniStr;
	
	@autoreleasepool {
		unichar *uniName = (unichar *)[name cStringUsingEncoding:NSUnicodeStringEncoding];
		uniStr.assign(uniName);
	}

	ft = _workBook->format(uniStr);

	format = [(JXLSFormat *)[JXLSFormat alloc] initWithFormat:ft];
	
	return format;
}
- (JXLSExtendedFormat *)extendedFormat
{
	return [self extendedFormatForFont:nil];
}
- (JXLSExtendedFormat *)extendedFormatForFont:(JXLSFont *)name
{
	JXLSExtendedFormat	*xFormat;
	xf_t				*ft;

	if(name) {
		ft = _workBook->xformat((font_t *)[name font]);
	} else {
		ft = _workBook->xformat();
	}
	
	xFormat = [[JXLSExtendedFormat alloc] initWithExtendedFormat:ft];
	
	return xFormat;
}

- (BOOL)setValue:(NSString *)content forProperty:(property_t)prop
{
	bool ret;

	ret = _workBook->property(prop, [content cStringUsingEncoding:NSUTF8StringEncoding]);

	return ret ? YES : NO;
}
- (void)setWindowPositionX:(uint16_t)horz Y:(uint16_t)vert
{
	_workBook->windPosition((unsigned16_t)horz, (unsigned16_t)vert);
}
- (void)setWindowSizeX:(uint16_t)horz Y:(uint16_t)vert
{
	_workBook->windSize((unsigned16_t)horz, (unsigned16_t)vert);
}
- (void)firstTab:(uint16_t)tab
{
	_workBook->firstTab((unsigned16_t)tab);
}
- (void)tabBarWidth:(uint16_t)width
{
	_workBook->tabBarWidth((unsigned16_t)width);
}


- (int)writeToFile:(NSString *)name
{
	string filename;
	
	filename = [name fileSystemRepresentation];
	
	return _workBook->Dump(filename);
}

#define WORKBOOK(a) ((xlslib_core::workbook *)(a))

- (BOOL)setColorWithRed:(uint8_t)red
				 green:(uint8_t)green
				  blue:(uint8_t)blue
				 index:(uint8_t)idx
{
	return WORKBOOK(_workBook)->setColor(red, green, blue, idx);
}

@end