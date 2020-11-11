//
//  JXLSWorkSheet.h
//  JXLS
//
//  Created by David Hoerl on 10/7/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#if defined(NSRect)
#define JXLSRECT NSRect
#else
#import <CoreGraphics/CoreGraphics.h>
#define JXLSRECT CGRect
#endif

@class JXLSRange;
@class JXLSCell;
@class JXLSExtendedFormat;
@class JXLSNumberFormat;

@interface JXLSWorkSheet : NSObject

- (instancetype)initWithWorkSheet:(void *)ws;	// worksheet *

- (void)makeActive;

// Note: While writing files with row indexes above 65,535 and column indexes above 255 appears to work,
// I have yet to find an XLS parser that doesn’t cut off above 65,535/255, which is the official limit.
// Please bear in mind, that these are 0-based! So the count limits are one above these limits.
// For more details, see:
// http://superuser.com/questions/366468/what-is-the-maximum-allowed-rows-in-a-microsoft-excel-xls-or-xlsx

// Note 2: Ordinary Excel cells are limited to 32,767 characters, while headers and footers are limited to 255 characters.
// Limitations in the implementation of xlslib cap cells at 2048 characters.

- (JXLSCell *)cellAtRow:(uint32_t)row col:(uint32_t)col;

- (JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col;
- (JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col withFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label;
- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label withFormat:(JXLSExtendedFormat *)extFormat;    // NULL format OK

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label;
- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label withFormat:(JXLSExtendedFormat *)extFormat;    // NULL format OK

- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl;
- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withNumberFormat:(int)numFormat;            // Deprecated
- (JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

- (void)setHeight:(uint16_t)height forRow:(uint32_t)row defaultFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK
- (void)setWidth:(uint16_t)height forColumn:(uint32_t)col defaultFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

- (void)mergeCellsInRect:(JXLSRECT)range;

//- (JXLSRange *)rangegroup:(NSRect)range;

@end
