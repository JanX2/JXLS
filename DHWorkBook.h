//
//  DHworkBook.h
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
#import <DHxls/xlstypes.h>
#import <DHxls/xlslib.h>
#import <DHxls/DHWorkSheet.h>
#import <DHxls/DHCell.h>
#endif

@class DHWorkSheet;
@class DHFont;
@class DHFormat;
@class DHExtendedFormat;

@interface DHWorkBook : NSObject

-(DHWorkSheet *)workSheetWithName:(NSString *)sheetName;	// worksheet* sheet(std::string/ustring sheetname);
-(DHWorkSheet *)workSheetByOffset:(NSUInteger)offset;		// worksheet* GetSheet(unsigned16_t sheetnum);
-(DHFont *)font:(NSString *)fontName;						// font_t* font(std::string name);
-(DHFormat *)format:(NSString *)formatStr;					// format_t* format(std::string formatstr);
-(DHExtendedFormat *)extendedFormat;						// xf_t* xformat(void)
-(DHExtendedFormat *)extendedFormat:(DHFont *)formatStr;	// xf_t* xformat(font_t* font)
-(BOOL)property:(property_t)prop value:(NSString *)content;	// bool property(property_t prop, const std::string& content);
-(void)windPosition:(uint32_t)horz :(uint32_t)vert;			// void SetPosition(unsigned16_t horz, unsigned16_t vert)
-(void)windSize:(uint32_t)horz :(uint32_t)vert;				// void SetSize(unsigned16_t horz, unsigned16_t vert)
-(void)firstTab:(uint32_t)tab;								// void SetFirstTab(unsigned16_t firstTab)
-(void)tabBarWidth:(uint32_t)width;							// void SetTabBarWidth(unsigned16_t width)

-(int)writeFile:(NSString *)fileName;						// int Dump(std::string filename);
@end
