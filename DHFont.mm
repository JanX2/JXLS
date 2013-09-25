//
//  DHFont.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "font.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "DHFont.h"

#define FONT(a) ((xlslib_core::font_t *)(a))

@implementation DHFont
{
	void		*aFont;		// xlslib_core::CFont *
}

-(instancetype)initWithFont:(void *)ft
{
	self = [super init];
	
	aFont = ft;
	
	return self;
}
-(void *)font
{
	return aFont;
}

-(void)setName:(NSString *)name
{
	FONT(aFont)->SetName([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
-(NSString *)name
{
	const std::string&	name = FONT(aFont)->GetName();
	
	NSString *string = [NSString stringWithCString:name.c_str() encoding:NSASCIIStringEncoding];
	
	return string;
}
-(void)setHeight:(uint16_t)fntheight
{
	FONT(aFont)->SetHeight(fntheight);
}
-(uint16_t)height
{
	return FONT(aFont)->GetHeight();
}
-(void)setBoldStyle:(boldness_option_t)fntboldness
{
	FONT(aFont)->SetBoldStyle(fntboldness);
}
-(uint16_t)boldStyle
{
	return FONT(aFont)->GetBoldStyle();
}
-(void)setUnderlineStyle:(underline_option_t)fntunderline
{
	FONT(aFont)->SetUnderlineStyle(fntunderline);
}
-(uint8_t)underlineStyle
{
	return FONT(aFont)->GetBoldStyle();
}
-(void)SetScriptStyle:(script_option_t)fntscript
{
	FONT(aFont)->SetScriptStyle(fntscript);
}
-(uint16_t)scriptStyle
{
	return FONT(aFont)->GetBoldStyle();
}
-(void)setColorName:(color_name_t)fntcolor
{
	FONT(aFont)->SetColor(fntcolor);
}
-(void)setColorIndex:(unsigned8_t)fntcolor
{
	FONT(aFont)->SetColor(fntcolor);
}
-(uint16_t)colorIndex
{
	return FONT(aFont)->GetColorIdx();
}
#if 1
-(void)setItalic:(BOOL)it
{
	FONT(aFont)->SetItalic(it);
}
-(BOOL)italic
{
	return (BOOL)FONT(aFont)->GetItalic();
}
-(void)setStrikeout:(BOOL)so
{
	FONT(aFont)->SetStrikeout(so);
}
-(BOOL)strikeOut
{
	return (BOOL)FONT(aFont)->GetStrikeout();
}
-(void)setOutline:(BOOL)ol
{
	FONT(aFont)->SetOutline(ol);
}
-(BOOL)outline
{
	return (BOOL)FONT(aFont)->GetOutline();
}
-(void)setShadow:(BOOL)sh
{
	FONT(aFont)->SetShadow(sh);
}
-(BOOL)shadow
{
	return (BOOL)FONT(aFont)->GetShadow();
}
#endif

-(void)setFamily:(uint8_t)fam
{
	FONT(aFont)->SetFamily(fam);
}
-(uint8_t)family
{
	return FONT(aFont)->GetFamily();
}
-(void)setCharset:(uint8_t)fam
{
	FONT(aFont)->SetCharset(fam);
}
-(uint8_t)charset
{
	return FONT(aFont)->GetCharset();
}
@end
