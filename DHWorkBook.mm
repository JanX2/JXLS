//
//  DHworkBook.m
//  DHxls
//
//  Created by David Hoerl on 10/6/08.
//  Copyright 2008 David Hoerl. All rights reserved.
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

using namespace std;
using namespace xlslib_core;

#import "DHWorkBook.h"

#import "DHWorkSheet.h"
#import "DHFont.h"
#import "DHFormat.h"
#import "DHExtendedFormat.h"

#define WORKBOOK(a) ((xlslib_core::workbook *)(a))


@implementation DHWorkBook
-(id)init
{
	self = [super init];
	
	// only time we actually allocate a C++ object
	aBook = new workbook;
	
	workSheets = [[NSMutableArray arrayWithCapacity:3] retain];  
	
	return self;
}
-(void)dealloc
{
	delete WORKBOOK(aBook);	

	[super dealloc];
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
	[aWorkSheet release];
	
	return aWorkSheet;
}
-(DHWorkSheet *)workSheetByOffset:(NSUInteger)offset
{
	if([workSheets count] < offset) {
		return nil;
	}
	return [workSheets objectAtIndex:offset];
}
-(DHFont *)font:(NSString *)name
{	
	DHFont				*aFont;
	font_t				*ft;
	
	ft = WORKBOOK(aBook)->font([name cStringUsingEncoding:NSASCIIStringEncoding]);

	aFont = [[[DHFont alloc] initWithFont:ft] autorelease];
	
	return aFont;
}
-(DHFormat *)format:(NSString *)name
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

	format = [[(DHFormat *)[DHFormat alloc] initWithFormat:ft] autorelease];
	
	return format;
}
-(DHExtendedFormat *)extendedFormat
{
	return [self extendedFormat:nil];
}
-(DHExtendedFormat *)extendedFormat:(DHFont *)name
{
	DHExtendedFormat	*xFormat;
	xf_t				*ft;

	if(name) {
		ft = WORKBOOK(aBook)->xformat((font_t *)[name font]);
	} else {
		ft = WORKBOOK(aBook)->xformat();
	}
	
	xFormat = [[[DHExtendedFormat alloc] initWithExtFormat:ft] autorelease];
	
	return xFormat;
}

-(BOOL)property:(property_t)prop value:(NSString *)content
{
	bool ret;

	ret = WORKBOOK(aBook)->property(prop, [content cStringUsingEncoding:NSUTF8StringEncoding]);

	return ret ? YES : NO;
}
-(void)windPosition:(uint32_t)horz :(uint32_t)vert
{
	WORKBOOK(aBook)->windPosition((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)windSize:(uint32_t)horz :(uint32_t)vert
{
	WORKBOOK(aBook)->windSize((unsigned16_t)horz, (unsigned16_t)vert);
}
-(void)firstTab:(uint32_t)tab
{
	WORKBOOK(aBook)->firstTab((unsigned16_t)tab);
}
-(void)tabBarWidth:(uint32_t)width
{
	WORKBOOK(aBook)->tabBarWidth((unsigned16_t)width);
}


-(int)writeFile:(NSString *)name
{
	string filename;
	
	filename = [name cStringUsingEncoding:NSUTF8StringEncoding];
	
	return WORKBOOK(aBook)->Dump(filename);
}
@end