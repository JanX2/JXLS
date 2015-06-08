//
//  JXLSFont.m
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
#import "font.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "JXLSFont.h"

#define FONT(a) ((xlslib_core::font_t *)(a))

@implementation JXLSFont
{
	xlslib_core::font_t *_font;
}

- (instancetype)initWithFont:(void *)ft
{
	self = [super init];
	
	_font = FONT(ft);
	
	return self;
}
- (void *)font
{
	return _font;
}

- (void)setName:(NSString *)name
{
	_font->SetName([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
- (NSString *)name
{
	const std::string&	name = _font->GetName();
	
	NSString *string = [NSString stringWithCString:name.c_str() encoding:NSASCIIStringEncoding];
	
	return string;
}
- (void)setHeight:(uint16_t)fntheight
{
	_font->SetHeight(fntheight);
}
- (uint16_t)height
{
	return _font->GetHeight();
}
- (void)setBoldStyle:(boldness_option_t)fntboldness
{
	_font->SetBoldStyle(fntboldness);
}
- (uint16_t)boldStyle
{
	return _font->GetBoldStyle();
}
- (void)setUnderlineStyle:(underline_option_t)fntunderline
{
	_font->SetUnderlineStyle(fntunderline);
}
- (uint8_t)underlineStyle
{
	return _font->GetBoldStyle();
}
- (void)SetScriptStyle:(script_option_t)fntscript
{
	_font->SetScriptStyle(fntscript);
}
- (uint16_t)scriptStyle
{
	return _font->GetBoldStyle();
}
- (void)setColorName:(color_name_t)fntcolor
{
	_font->SetColor(fntcolor);
}
- (void)setColorIndex:(unsigned8_t)fntcolor
{
	_font->SetColor(fntcolor);
}
- (uint16_t)colorIndex
{
	return _font->GetColorIdx();
}
#if 1
- (void)setItalic:(BOOL)it
{
	_font->SetItalic(it);
}
- (BOOL)italic
{
	return (BOOL)_font->GetItalic();
}
- (void)setStrikeout:(BOOL)so
{
	_font->SetStrikeout(so);
}
- (BOOL)strikeOut
{
	return (BOOL)_font->GetStrikeout();
}
- (void)setOutline:(BOOL)ol
{
	_font->SetOutline(ol);
}
- (BOOL)outline
{
	return (BOOL)_font->GetOutline();
}
- (void)setShadow:(BOOL)sh
{
	_font->SetShadow(sh);
}
- (BOOL)shadow
{
	return (BOOL)_font->GetShadow();
}
#endif

- (void)setFamily:(uint8_t)fam
{
	_font->SetFamily(fam);
}
- (uint8_t)family
{
	return _font->GetFamily();
}
- (void)setCharset:(uint8_t)fam
{
	_font->SetCharset(fam);
}
- (uint8_t)charset
{
	return _font->GetCharset();
}
@end
