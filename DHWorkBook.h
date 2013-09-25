//
//  DHWorkBook.h
//  DHxls
//
//  Created by David Hoerl on 10/6/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#ifdef __IOS_LIBRARY__
#import "xlstypes.h"
#import "xlslib.h"
#import "DHWorkSheet.h"
#import "DHCell.h"
#else
#import <DHxls/common/xlstypes.h>
#import <DHxls/xlslib.h>
#import <DHxls/DHWorkSheet.h>
#import <DHxls/DHCell.h>
#endif

@class DHWorkSheet;
@class DHFont;
@class DHFormat;
@class DHExtendedFormat;

@interface DHWorkBook : NSObject

-(DHWorkSheet *)workSheetWithName:(NSString *)sheetName;			// worksheet* sheet(std::string/ustring sheetname);
-(DHWorkSheet *)workSheetForOffset:(uint16_t)offset;				// worksheet* GetSheet(unsigned16_t sheetnum);
-(DHFont *)fontWithName:(NSString *)fontName;						// font_t* font(std::string name);
-(DHFormat *)formatWithString:(NSString *)formatStr;				// format_t* format(std::string formatstr);
-(DHExtendedFormat *)extendedFormat;								// xf_t* xformat(void)
-(DHExtendedFormat *)extendedFormatForFont:(DHFont *)formatStr;		// xf_t* xformat(font_t* font)
-(BOOL)setValue:(NSString *)content forProperty:(property_t)prop;	// bool property(property_t prop, const std::string& content);
-(void)setWindowPositionX:(uint16_t)horz Y:(uint16_t)vert;			// void SetPosition(unsigned16_t horz, unsigned16_t vert)
-(void)setWindowSizeX:(uint16_t)horz Y:(uint16_t)vert;				// void SetSize(unsigned16_t horz, unsigned16_t vert)
-(void)firstTab:(uint16_t)tab;										// void SetFirstTab(unsigned16_t firstTab)
-(void)tabBarWidth:(uint16_t)width;									// void SetTabBarWidth(unsigned16_t width)

-(int)writeToFile:(NSString *)fileName;								// int Dump(std::string filename);
@end
