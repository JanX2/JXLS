//
//  JXLSWorkBook.h
//  JXLS
//
//  Created by David Hoerl on 10/6/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

@class JXLSWorkSheet;
@class JXLSFont;
@class JXLSFormat;
@class JXLSExtendedFormat;

@interface JXLSWorkBook : NSObject

- (JXLSWorkSheet *)workSheetWithName:(NSString *)sheetName;			// worksheet* sheet(std::string/ustring sheetname);
- (JXLSWorkSheet *)workSheetForOffset:(uint16_t)offset;				// worksheet* GetSheet(unsigned16_t sheetnum);
- (JXLSFont *)fontWithName:(NSString *)fontName;					// font_t* font(std::string name);
- (JXLSFormat *)formatWithString:(NSString *)formatStr;				// format_t* format(std::string formatstr);
- (JXLSExtendedFormat *)extendedFormat;								// xf_t* xformat(void)
- (JXLSExtendedFormat *)extendedFormatForFont:(JXLSFont *)formatStr;// xf_t* xformat(font_t* font)
- (BOOL)setValue:(NSString *)content forProperty:(property_t)prop;	// bool property(property_t prop, const std::string& content);
- (void)setWindowPositionX:(uint16_t)horz Y:(uint16_t)vert;			// void SetPosition(unsigned16_t horz, unsigned16_t vert)
- (void)setWindowSizeX:(uint16_t)horz Y:(uint16_t)vert;				// void SetSize(unsigned16_t horz, unsigned16_t vert)
- (void)firstTab:(uint16_t)tab;										// void SetFirstTab(unsigned16_t firstTab)
- (void)tabBarWidth:(uint16_t)width;								// void SetTabBarWidth(unsigned16_t width)

- (int)writeToFile:(NSString *)fileName;							// int Dump(std::string filename);

- (BOOL)setColorWithRed:(uint8_t)red
				 green:(uint8_t)green
				  blue:(uint8_t)blue
				 index:(uint8_t)idx;								// 8 <= idx <= 64
@end
