//
//  JXLSExtendedFormat.h
//  JXLS
//
//  Created by David Hoerl on 10/7/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

@class JXLSFont;	// NSCopying

@interface JXLSExtendedFormat : NSObject

+(JXLSExtendedFormat *)formatWithFormat:(JXLSExtendedFormat *)aFormat;

- (instancetype)initWithExtendedFormat:(void *)xft;	// xlslib_core::CExtFormat *
- (void *)extendedFormat;

- (void)setFont:(JXLSFont *)font;
- (JXLSFont *)font;

- (void)setFormatBuiltin:(format_number_t)formatidx;
- (void)setFormat:(format_t *)fmt;
- (void)setHorizontalAlignment:(halign_option_t)ha_option;
- (uint8_t)horizontalAlignment;
- (void)setVerticalAlignment:(valign_option_t)va_option;
- (uint8_t)verticalAlignment;
- (void)setIndentation:(indent_option_t)indent_option;
- (uint8_t)indentation;
- (void)setTextOrientation:(txtori_option_t)ori_option;
- (uint8_t)textOrientation;
- (void)setForegroundFillColor:(color_name_t)color;
- (void)setForegroundFillColorIndex:(unsigned8_t)color;
- (uint8_t)foregroundFillColor;
- (void)setBackgroundFillColor:(color_name_t)color;
- (void)setBackgroundFillColorIndex:(unsigned8_t)color;
- (uint8_t)backgroundFillColor;
- (void)setFillStyle:(fill_option_t)fill;
- (uint8_t)fillStyle;
- (void)setLocked:(BOOL)locked_opt;
- (BOOL)locked;
- (void)setHidden:(BOOL)hidden_opt;
- (BOOL)hidden;
- (void)setWraps:(BOOL)wrap_opt;
- (void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side;
- (void)setBorderColor:(color_name_t)color forSide:(border_side_t)side;
- (void)setBorderColorIndex:(unsigned8_t)color forSide:(border_side_t)side;
- (void)borderStyle:(border_side_t)side;

@end
