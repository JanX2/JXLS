//
//  DHWorkSheet.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#include "globalrec.h"
#include "workbook.h"
#include "sheetrec.h"
#endif

using namespace std;
using namespace xlslib_core;

#import "DHWorkSheet.h"

#import "DHRange.h"
#import "DHCell.h"
#import "DHExtendedFormat.h"

#define WORKSHEET(a) ((xlslib_core::worksheet *)(a))

@implementation DHWorkSheet

-(id)initWithWorkSheet:(void *)ws
{
	self = [super init];
	
	aWorkSheet = ws;
	
	return self;
}

-(void)makeActive
{
	WORKSHEET(aWorkSheet)->MakeActive();
}
-(DHCell *)cell:(unsigned short)row col:(unsigned short)col
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->FindCell(row, col);
	
	if(cl) {
		aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	} else {
		aCell = nil;
	}
	
	return aCell;
}

-(DHCell *)blank:(id)dontCare row:(unsigned short)row col:(unsigned short)col
{
	return [self blank:dontCare row:row col:col format:nil];
}
-(DHCell *)blank:(id)dontCare row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->blank(row, col, (xf_t *)[extFormat extFormat]);
	
	aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	
	return aCell;
}

-(DHCell *)cLabel:(char *)lbl row:(unsigned short)row col:(unsigned short)col
{
	return [self cLabel:lbl row:row col:col format:nil];
}
-(DHCell *)cLabel:(char *)lbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;
	std::string		str;

	str.assign(lbl);

	cl = WORKSHEET(aWorkSheet)->label(row, col, str, (xf_t *)[extFormat extFormat]);
	
	aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	
	return aCell;
}

-(DHCell *)label:(NSString *)lbl row:(unsigned short)row col:(unsigned short)col
{
	return [self label:lbl row:row col:col format:nil];
}
-(DHCell *)label:(NSString *)lbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat 
{
	DHCell			*aCell;
	cell_t			*cl;
	unichar			*uniName;
	ustring			uniStr;
	size_t			len;
	
	len = [lbl length];
	
	uniName = (unichar *)calloc(len+1, sizeof(unichar));
	[lbl getCharacters:uniName];
	uniStr.assign(uniName);
	free(uniName);

	cl = WORKSHEET(aWorkSheet)->label(row, col, uniStr, (xf_t *)[extFormat extFormat]);
	
	aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	
	return aCell;
}

-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col
{
	return [self number:dbl row:row col:col format:nil];
}
-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col numberFormat:(int)numFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->number(row, col, dbl, (format_number_t)numFormat, (xf_t *)NULL);
	
	aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	
	return aCell;
}
-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->number(row, col, dbl, (xf_t *)[extFormat extFormat]);
	
	aCell = [[[DHCell alloc] initWithCell:cl] autorelease];
	
	return aCell;
}

-(void)height:(unsigned short)height row:(unsigned short)row format:(DHExtendedFormat *)extFormat
{
	WORKSHEET(aWorkSheet)->rowheight(row, height, (xf_t *)[extFormat extFormat]);
}
-(void)width:(unsigned short)width col:(unsigned short)col format:(DHExtendedFormat *)extFormat
{
	WORKSHEET(aWorkSheet)->colwidth(col, width, (xf_t *)[extFormat extFormat]);
}

-(void)merge:(NSRect)rect
{
	unsigned16_t	first_row, first_col, last_row, last_col;

	first_row	= (unsigned16_t)rect.origin.y;
	first_col	= (unsigned16_t)rect.origin.x;
	last_row	= first_row + (unsigned16_t)rect.size.height;
	last_col	= first_col + (unsigned16_t)rect.size.width;

	WORKSHEET(aWorkSheet)->merge(first_row, first_col, last_row, last_col);

	return;
}
#if 0
-(DHRange *)rangegroup:(NSRect)rect
{
	DHRange			*aRange;
	range			*rg;
	unsigned16_t	first_row, first_col, last_row, last_col;

	first_row	= (unsigned16_t)rect.origin.y;
	first_col	= (unsigned16_t)rect.origin.x;
	last_row	= first_row + (unsigned16_t)rect.size.height;
	last_col	= first_col + (unsigned16_t)rect.size.width;
	
	rg = WORKSHEET(aWorkSheet)->rangegroup(first_row, first_col, last_row, last_col);
	
	aRange = [[[DHRange alloc] initWithRange:rg] autorelease];
	
	return aRange;
}
#endif
@end
