//
//  JXLSFont.h
//  JXLS
//
//  Created by David Hoerl on 10/7/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

@interface JXLSFont : NSObject

//+(JXLSFont *)fontWithName:(NSString *)fontName;
- (instancetype)initWithFont:(void *)ft;	// xlslib_core::CFont *
- (void *)font;

- (void)setName:(NSString *)name;
- (NSString *)name;
- (void)setHeight:(uint16_t)fntheight;
- (uint16_t)height;
- (void)setBoldStyle:(boldness_option_t)fntboldness;
- (uint16_t)boldStyle;
- (void)setUnderlineStyle:(underline_option_t)fntunderline;
- (uint8_t)underlineStyle;
- (void)SetScriptStyle:(script_option_t)fntscript;
- (uint16_t)scriptStyle;
- (void)setColorName:(color_name_t)fntcolor;
- (void)setColorIndex:(unsigned8_t)fntcolor;
- (uint16_t)colorIndex;

- (void)setItalic:(BOOL)italic;
- (BOOL)italic;
- (void)setStrikeout:(BOOL)so;
- (BOOL)strikeOut;
- (void)setOutline:(BOOL)ol;
- (BOOL)outline;

- (void)setFamily:(uint8_t)fam;
- (uint8_t)family;
- (void)setCharset:(uint8_t)fam;
- (uint8_t)charset;

@end
