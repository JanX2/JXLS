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

#define WORKBOOK(a) ((xlslib_core::workbook *)(a))


@implementation DHWorkBook
{
	void						*aBook;						// xlslib_core::workbook
	NSMutableArray				*workSheets;	
}

-(instancetype)init
{
	self = [super init];
	
	// only time we actually allocate a C++ object
	aBook = new workbook;
	
	workSheets = [NSMutableArray arrayWithCapacity:3];  
	
	return self;
}
-(void)dealloc
{
	delete WORKBOOK(aBook);	
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
	
	ws = WORKBOOK(aBook)->sheet(uniStr);
	
	aWorkSheet = [[DHWorkSheet alloc] initWithWorkSheet:ws];
	[workSheets addObject:aWorkSheet];
	
	return aWorkSheet;
}
-(DHWorkSheet *)workSheetForOffset:(uint16_t)offset
{
	if([workSheets count] < offset) {
		return nil;
	}
	return [workSheets objectAtIndex:offset];
}
-(DHFont *)fontWithName:(NSString *)name
{	
	DHFont				*aFont;
	font_t				*ft;
	
	ft = WORKBOOK(aBook)->font([name cStringUsingEncoding:NSASCIIStringEncoding]);

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

	ft = WORKBOOK(aBook)->format(uniStr);

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
		ft = WORKBOOK(aBook)->xformat((font_t *)[name font]);
	} else {
		ft = WORKBOOK(aBook)->xformat();
	}
	
	xFormat = [[DHExtendedFormat alloc] initWithExtendedFormat:ft];
	
	return xFormat;
}

-(BOOL)setValue:(NSString *)content forProperty:(property_t)prop
{
	bool ret;

	ret = WORKBOOK(aBook)->property(prop, [content cStringUsingEncoding:NSUTF8StringEncoding]);

	return ret ? YES : NO;
}
-(void)setWindowPositionX:(uint16_t)horz Y:(uint16_t)vert
{
	WORKBOOK(aBook)->windPosition((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)setWindowSizeX:(uint16_t)horz Y:(uint16_t)vert
{
	WORKBOOK(aBook)->windSize((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)firstTab:(uint16_t)tab
{
	WORKBOOK(aBook)->firstTab((unsigned16_t)tab);
}
-(void)tabBarWidth:(uint16_t)width
{
	WORKBOOK(aBook)->tabBarWidth((unsigned16_t)width);
}


-(int)writeToFile:(NSString *)name
{
	string filename;
	
	filename = [name cStringUsingEncoding:NSUTF8StringEncoding];
	
	return WORKBOOK(aBook)->Dump(filename);
}
@end