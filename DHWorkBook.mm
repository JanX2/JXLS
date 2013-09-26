//
//  DHWorkBook.m
//  DHxls
//
//  Created by David Hoerl on 10/6/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
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

#import "DHWorkBook.h"

#import "DHWorkSheet.h"
#import "DHFont.h"
#import "DHFormat.h"
#import "DHExtendedFormat.h"


@implementation DHWorkBook
{
	xlslib_core::workbook		*_workBook;
	NSMutableArray				*_workSheets;
}

-(instancetype)init
{
	self = [super init];
	
	// only time we actually allocate a C++ object
	_workBook = new workbook;
	
	_workSheets = [NSMutableArray arrayWithCapacity:3];
	
	return self;
}
-(void)dealloc
{
	delete _workBook;
}

-(DHWorkSheet *)workSheetWithName:(NSString *)name
{
	DHWorkSheet			*aWorkSheet;
	worksheet			*ws;
	unichar				*uniName;
	ustring				uniStr;
	size_t				len;
	
	len = [name length];
	
	uniName = (unichar *)calloc(len+1, sizeof(unichar));
	[name getCharacters:uniName];
	//uniStr = uniName;
	uniStr.assign(uniName);
	free(uniName);
	
	ws = _workBook->sheet(uniStr);
	
	aWorkSheet = [[DHWorkSheet alloc] initWithWorkSheet:ws];
	[_workSheets addObject:aWorkSheet];
	
	return aWorkSheet;
}
-(DHWorkSheet *)workSheetForOffset:(uint16_t)offset
{
	if([_workSheets count] < offset) {
		return nil;
	}
	return [_workSheets objectAtIndex:offset];
}
-(DHFont *)fontWithName:(NSString *)name
{	
	DHFont				*aFont;
	font_t				*ft;
	
	ft = _workBook->font([name cStringUsingEncoding:NSASCIIStringEncoding]);

	aFont = [[DHFont alloc] initWithFont:ft];
	
	return aFont;
}
-(DHFormat *)formatWithString:(NSString *)name
{
	DHFormat			*format;
	format_t			*ft;
	unichar				*uniName;
	ustring				uniStr;
	size_t				len;

	len = [name length];

	uniName = (unichar *)calloc(len+1, sizeof(unichar));
	[name getCharacters:uniName];
	uniStr.assign(uniName);
	free(uniName);

	ft = _workBook->format(uniStr);

	format = [(DHFormat *)[DHFormat alloc] initWithFormat:ft];
	
	return format;
}
-(DHExtendedFormat *)extendedFormat
{
	return [self extendedFormatForFont:nil];
}
-(DHExtendedFormat *)extendedFormatForFont:(DHFont *)name
{
	DHExtendedFormat	*xFormat;
	xf_t				*ft;

	if(name) {
		ft = _workBook->xformat((font_t *)[name font]);
	} else {
		ft = _workBook->xformat();
	}
	
	xFormat = [[DHExtendedFormat alloc] initWithExtendedFormat:ft];
	
	return xFormat;
}

-(BOOL)setValue:(NSString *)content forProperty:(property_t)prop
{
	bool ret;

	ret = _workBook->property(prop, [content cStringUsingEncoding:NSUTF8StringEncoding]);

	return ret ? YES : NO;
}
-(void)setWindowPositionX:(uint16_t)horz Y:(uint16_t)vert
{
	_workBook->windPosition((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)setWindowSizeX:(uint16_t)horz Y:(uint16_t)vert
{
	_workBook->windSize((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)firstTab:(uint16_t)tab
{
	_workBook->firstTab((unsigned16_t)tab);
}
-(void)tabBarWidth:(uint16_t)width
{
	_workBook->tabBarWidth((unsigned16_t)width);
}


-(int)writeToFile:(NSString *)name
{
	string filename;
	
	filename = [name cStringUsingEncoding:NSUTF8StringEncoding];
	
	return _workBook->Dump(filename);
}
@end