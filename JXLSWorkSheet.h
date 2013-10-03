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
#define JXLSRECT CGRect
#endif

@class JXLSRange;
@class JXLSCell;
@class JXLSExtendedFormat;
@class JXLSNumberFormat;

@interface JXLSWorkSheet : NSObject

-(instancetype)initWithWorkSheet:(void *)ws;	// worksheet *

-(void)makeActive;

-(JXLSCell *)cellAtRow:(uint32_t)row col:(uint32_t)col;

-(JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col;
-(JXLSCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col withFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label;
-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label withFormat:(JXLSExtendedFormat *)extFormat;    // NULL format OK

-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label;
-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label withFormat:(JXLSExtendedFormat *)extFormat;    // NULL format OK

-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl;
-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withNumberFormat:(int)numFormat;            // Deprecated
-(JXLSCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

-(void)setHeight:(uint16_t)height forRow:(uint32_t)row defaultFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK
-(void)setWidth:(uint16_t)height forColumn:(uint32_t)col defaultFormat:(JXLSExtendedFormat *)extFormat;	// NULL format OK

-(void)mergeCellsInRect:(JXLSRECT)range;

//-(JXLSRange *)rangegroup:(NSRect)range;

@end
