//
//  DHWorkSheet.h
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

@class DHRange;
@class DHCell;
@class DHExtendedFormat;
@class DHNumberFormat;

@interface DHWorkSheet : NSObject {
	void	*aWorkSheet;	// xlslib_core::worksheet *
}
-(id)initWithWorkSheet:(void *)ws;	// worksheet *

-(void)makeActive;

-(DHCell *)cell:(unsigned short)row col:(unsigned short)col;
-(DHCell *)blank:(id)dontCare row:(unsigned short)row col:(unsigned short)col;
-(DHCell *)blank:(id)dontCare row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat;	// NULL format OK

-(DHCell *)cLabel:(char *)lbl row:(unsigned short)row col:(unsigned short)col;
-(DHCell *)cLabel:(char *)lbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat;	// NULL format OK

-(DHCell *)label:(NSString *)lbl row:(unsigned short)row col:(unsigned short)col;
-(DHCell *)label:(NSString *)lbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat;	// NULL format OK

-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col;
-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col numberFormat:(int)numFormat;			// Deprecated
-(DHCell *)number:(double)dbl row:(unsigned short)row col:(unsigned short)col format:(DHExtendedFormat *)extFormat;	// NULL format OK

-(void)height:(unsigned short)row row:(unsigned short)row format:(DHExtendedFormat *)extFormat;	// NULL format OK
-(void)width:(unsigned short)col col:(unsigned short)col format:(DHExtendedFormat *)extFormat;	// NULL format OK

-(void)merge:(NSRect)range;

//-(DHRange *)rangegroup:(NSRect)range;
@end
