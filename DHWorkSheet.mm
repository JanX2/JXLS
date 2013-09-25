//
//  DHWorkSheet.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#include "globalrec.h"
#include "workbook.h"
#include "sheetrec.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "DHWorkSheet.h"

#import "DHRange.h"
#import "DHCell.h"
#import "DHExtendedFormat.h"

#define WORKSHEET(a) ((xlslib_core::worksheet *)(a))

@implementation DHWorkSheet
{
	void	*aWorkSheet;	// xlslib_core::worksheet *
}

-(instancetype)initWithWorkSheet:(void *)ws
{
	self = [super init];
	
	aWorkSheet = ws;
	
	return self;
}

-(void)makeActive
{
	WORKSHEET(aWorkSheet)->MakeActive();
}
-(DHCell *)cellAtRow:(uint32_t)row col:(uint32_t)col
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->FindCell(row, col);
	
	if(cl) {
		aCell = [[DHCell alloc] initWithCell:cl];
	} else {
		aCell = nil;
	}
	
	return aCell;
}

-(DHCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col
{
	return [self addEmptyCellAtRow:row column:col withFormat:nil];
}
-(DHCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col withFormat:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->blank(row, col, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[DHCell alloc] initWithCell:cl];
	
	return aCell;
}

- (DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label
{
	return [self setCellAtRow:row column:col toCString:label withFormat:nil ];
}

- (DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label withFormat:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;
	std::string		str;

	str.assign(label);

	cl = WORKSHEET(aWorkSheet)->label(row, col, str, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[DHCell alloc] initWithCell:cl];
	
	return aCell;
}

- (DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label
{
	return [self setCellAtRow:row column:col toString:label withFormat:nil ];
}

- (DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label withFormat:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;
	unichar			*uniName;
	ustring			uniStr;
	size_t			len;
	
	len = [label length];
	
	uniName = (unichar *)calloc(len+1, sizeof(unichar));
	[label getCharacters:uniName];
	uniStr.assign(uniName);
	free(uniName);

	cl = WORKSHEET(aWorkSheet)->label(row, col, uniStr, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[DHCell alloc] initWithCell:cl];
	
	return aCell;
}

-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl
{
	return [self setCellAtRow:row column:col toDoubleValue:dbl withFormat:nil];
}

- (DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withNumberFormat:(int)numFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->number(row, col, dbl, (format_number_t)numFormat, (xf_t *)NULL);
	
	aCell = [[DHCell alloc] initWithCell:cl];
	
	return aCell;
}
-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withFormat:(DHExtendedFormat *)extFormat
{
	DHCell			*aCell;
	cell_t			*cl;

	cl = WORKSHEET(aWorkSheet)->number(row, col, dbl, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[DHCell alloc] initWithCell:cl];
	
	return aCell;
}

-(void)setHeight:(uint32_t)height forRow:(uint32_t)row defaultFormat:(DHExtendedFormat *)extFormat
{
	WORKSHEET(aWorkSheet)->rowheight(row, height, (xf_t *)[extFormat extendedFormat]);
}
-(void)setWidth:(uint32_t)width forColumn:(uint32_t)col defaultFormat:(DHExtendedFormat *)extFormat
{
	WORKSHEET(aWorkSheet)->colwidth(col, width, (xf_t *)[extFormat extendedFormat]);
}

-(void)mergeCellsInRect:(DHRECT)rect
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
