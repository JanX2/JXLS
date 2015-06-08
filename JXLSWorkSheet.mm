//
//  JXLSWorkSheet.m
//  JXLS
//
//  Created by David Hoerl on 10/7/08.
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
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "JXLSWorkSheet.h"

#import "JXLSRange.h"
#import "JXLSCell.h"
#import "JXLSExtendedFormat.h"

#define WORKSHEET(a) ((xlslib_core::worksheet *)(a))

@implementation JXLSWorkSheet
{
	xlslib_core::worksheet *_workSheet;
}

- (instancetype)initWithWorkSheet:(void *)ws
{
	self = [super init];
	
	_workSheet = WORKSHEET(ws);
	
	return self;
}

- (void)makeActive
{
	_workSheet->MakeActive();
}
- (JXLSCell *)cellAtRow:(uint32_t)row col:(uint32_t)col
{
	JXLSCell		*aCell;
	cell_t			*cl;

	cl = _workSheet->FindCell(row, col);
	
	if(cl) {
		aCell = [[JXLSCell alloc] initWithCell:cl];
	} else {
		aCell = nil;
	}
	
	return aCell;
}

- (JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col
{
	return [self addEmptyCellAtRow:row column:col withFormat:nil];
}
- (JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col withFormat:(JXLSExtendedFormat *)extFormat
{
	JXLSCell		*aCell;
	cell_t			*cl;

	cl = _workSheet->blank(row, col, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[JXLSCell alloc] initWithCell:cl];
	
	return aCell;
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label
{
	return [self setCellAtRow:row column:col toCString:label withFormat:nil];
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label withFormat:(JXLSExtendedFormat *)extFormat
{
	JXLSCell		*aCell;
	cell_t			*cl;
	std::string		str;

	str.assign(label);

	cl = _workSheet->label(row, col, str, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[JXLSCell alloc] initWithCell:cl];
	
	return aCell;
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label
{
	return [self setCellAtRow:row column:col toString:label withFormat:nil];
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label withFormat:(JXLSExtendedFormat *)extFormat
{
	JXLSCell		*aCell;
	cell_t			*cl;
	unichar			*uniName;
	ustring			uniStr;
	
	@autoreleasepool {
		uniName = (unichar *)[label cStringUsingEncoding:NSUnicodeStringEncoding];
		uniStr.assign(uniName);
	}
	
	cl = _workSheet->label(row, col, uniStr, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[JXLSCell alloc] initWithCell:cl];
	
	return aCell;
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl
{
	return [self setCellAtRow:row column:col toDoubleValue:dbl withFormat:nil];
}

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withNumberFormat:(int)numFormat
{
	JXLSCell		*aCell;
	cell_t			*cl;

	cl = _workSheet->number(row, col, dbl, (format_number_t)numFormat, (xf_t *)NULL);
	
	aCell = [[JXLSCell alloc] initWithCell:cl];
	
	return aCell;
}
- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withFormat:(JXLSExtendedFormat *)extFormat
{
	JXLSCell		*aCell;
	cell_t			*cl;

	cl = _workSheet->number(row, col, dbl, (xf_t *)[extFormat extendedFormat]);
	
	aCell = [[JXLSCell alloc] initWithCell:cl];
	
	return aCell;
}

- (void)setHeight:(uint16_t)height forRow:(uint32_t)row defaultFormat:(JXLSExtendedFormat *)extFormat
{
	_workSheet->rowheight(row, height, (xf_t *)[extFormat extendedFormat]);
}
- (void)setWidth:(uint16_t)width forColumn:(uint32_t)col defaultFormat:(JXLSExtendedFormat *)extFormat
{
	_workSheet->colwidth(col, width, (xf_t *)[extFormat extendedFormat]);
}

- (void)mergeCellsInRect:(JXLSRECT)rect
{
	unsigned16_t	first_row, first_col, last_row, last_col;

	first_row	= (unsigned16_t)rect.origin.y;
	first_col	= (unsigned16_t)rect.origin.x;
	last_row	= first_row + (unsigned16_t)rect.size.height;
	last_col	= first_col + (unsigned16_t)rect.size.width;

	_workSheet->merge(first_row, first_col, last_row, last_col);

	return;
}

#if 0
- (JXLSRange *)rangegroup:(NSRect)rect
{
	JXLSRange			*aRange;
	range			*rg;
	unsigned16_t	first_row, first_col, last_row, last_col;

	first_row	= (unsigned16_t)rect.origin.y;
	first_col	= (unsigned16_t)rect.origin.x;
	last_row	= first_row + (unsigned16_t)rect.size.height;
	last_col	= first_col + (unsigned16_t)rect.size.width;
	
	rg = WORKSHEET(aWorkSheet)->rangegroup(first_row, first_col, last_row, last_col);
	
	aRange = [[[JXLSRange alloc] initWithRange:rg] autorelease];
	
	return aRange;
}
#endif

@end
