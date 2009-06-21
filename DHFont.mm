//
//  DHFont.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "font.h"
#endif

using namespace std;
using namespace xlslib_core;

#import "DHFont.h"

#define FONT(a) ((xlslib_core::font_t *)(a))

@implementation DHFont
-(id)initWithFont:(void *)ft
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
	NSString			*string;
	const std::string	*name;
	
	name = FONT(aFont)->GetName();
	
	string = [NSString stringWithCString:name->c_str()];
	
	return string;
}
-(void)setHeight:(unsigned short)fntheight
{
	FONT(aFont)->SetHeight(fntheight);
}
-(unsigned short)height
{
	return FONT(aFont)->GetHeight();
}
-(void)setBoldStyle:(boldness_option_t)fntboldness
{
	FONT(aFont)->SetBoldStyle(fntboldness);
}
-(unsigned short)boldStyle
{
	return FONT(aFont)->GetBoldStyle();
}
-(void)setUnderlineStyle:(underline_option_t)fntunderline
{
	FONT(aFont)->SetUnderlineStyle(fntunderline);
}
-(unsigned char)underlineStyle
{
	return FONT(aFont)->GetBoldStyle();
}
-(void)SetScriptStyle:(script_option_t)fntscript
{
	FONT(aFont)->SetScriptStyle(fntscript);
}
-(unsigned short)scriptStyle
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
-(unsigned short)colorIndex
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

-(void)setFamily:(unsigned char)fam
{
	FONT(aFont)->SetFamily(fam);
}
-(unsigned char)family
{
	return FONT(aFont)->GetFamily();
}
-(void)setCharset:(unsigned char)fam
{
	FONT(aFont)->SetCharset(fam);
}
-(unsigned char)charset
{
	return FONT(aFont)->GetCharset();
}
@end
