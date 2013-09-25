//
//  DHWorkSheet.h
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#if defined(NSRect)
#define DHRECT NSRect
#else
#define DHRECT CGRect
#endif

@class DHRange;
@class DHCell;
@class DHExtendedFormat;
@class DHNumberFormat;

@interface DHWorkSheet : NSObject

-(instancetype)initWithWorkSheet:(void *)ws;	// worksheet *

-(void)makeActive;

-(DHCell *)cellAtRow:(uint32_t)row col:(uint32_t)col;
-(DHCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col;
-(DHCell *)addEmptyCellAtRow:(uint32_t)row column:(uint32_t)col withFormat:(DHExtendedFormat *)extFormat;	// NULL format OK

-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label;
-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toCString:(char *)label withFormat:(DHExtendedFormat *)extFormat;    // NULL format OK

-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label;
-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toString:(NSString *)label withFormat:(DHExtendedFormat *)extFormat;    // NULL format OK

-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl;
-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withNumberFormat:(int)numFormat;            // Deprecated
-(DHCell *)setCellAtRow:(uint32_t)row column:(uint32_t)col toDoubleValue:(double)dbl withFormat:(DHExtendedFormat *)extFormat;	// NULL format OK

-(void)setHeight:(uint32_t)height forRow:(uint32_t)row defaultFormat:(DHExtendedFormat *)extFormat;	// NULL format OK
-(void)setWidth:(uint32_t)height forColumn:(uint32_t)col defaultFormat:(DHExtendedFormat *)extFormat;	// NULL format OK

-(void)mergeCellsInRect:(DHRECT)range;

//-(DHRange *)rangegroup:(NSRect)range;

@end
