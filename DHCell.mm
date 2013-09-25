//
//  DHCell.mm
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "cell.h"
#import "format.h"
#import "extformat.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "DHCell.h"

#import "DHFont.h"
#import "DHFormat.h"
#import "DHExtendedFormat.h"

#define CELL(a) ((xlslib_core::cell_t *)(a))

@implementation DHCell
{
	void	*aCell;
}

-(instancetype)initWithCell:(void *)cl
{
	self = [super init];
	
	aCell = cl;
	
	return self;
}
-(void *)cell
{
	return aCell;
}

// xf_i interface
-(void)setFont:(DHFont *)aFont
{
	CELL(aCell)->font((font_t *)[aFont font]);
}
-(void)setHorizontalAlignment:(halign_option_t)ha_option
{
	CELL(aCell)->halign(ha_option);
}
-(void)setVerticalAlignment:(valign_option_t)va_option
{
	CELL(aCell)->valign(va_option);
}
-(void)setIndentation:(indent_option_t)indent_option
{
	CELL(aCell)->indent(indent_option);
}
-(void)setOrientation:(txtori_option_t)ori_option
{
	CELL(aCell)->orientation(ori_option);
}
-(void)setForegroundFillColor:(color_name_t)color
{
	CELL(aCell)->fillfgcolor(color);
}
-(void)setBackgroundFillColor:(color_name_t)color
{
	CELL(aCell)->fillbgcolor(color);
}
-(void)setFillStyle:(fill_option_t)fill
{
	CELL(aCell)->fillstyle(fill);
}
-(void)setLocked:(BOOL)locked_opt
{
	CELL(aCell)->locked((bool)locked_opt);
}
-(void)setHidden:(BOOL)hidden_opt
{
	CELL(aCell)->hidden((bool)hidden_opt);
}
-(void)setWraps:(BOOL)wrap_opt
{
	CELL(aCell)->wrap((bool)wrap_opt);
}
-(void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	CELL(aCell)->borderstyle(side, style);
}
-(void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	CELL(aCell)->bordercolor(side, color);
}

//font_i interface
-(void)setFontName:(NSString *)name
{
	CELL(aCell)->fontname([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
-(void)setFontHeight:(uint16_t)fntheight
{
	CELL(aCell)->fontheight((unsigned16_t)fntheight);
}
-(void)setFontBold:(boldness_option_t)fntboldness
{
	CELL(aCell)->fontbold(fntboldness);
}
-(void)setFontUnderline:(underline_option_t)fntunderline
{
	CELL(aCell)->fontunderline(fntunderline);
}
-(void)setFontScript:(script_option_t)fntscript
{
	CELL(aCell)->fontscript(fntscript);
}
-(void)setFontColor:(color_name_t)fntcolor
{
	CELL(aCell)->fontcolor(fntcolor);
}
-(void)setFontItalic:(BOOL)italic
{
	CELL(aCell)->fontitalic((bool)italic);
}
-(void)setFontStrikeout:(BOOL)so
{
	CELL(aCell)->fontstrikeout((bool)so);
}
-(void)setFontOutline:(BOOL)ol
{
	CELL(aCell)->fontoutline((bool)ol);
}
-(void)setFontShadow:(BOOL)sh
{
	CELL(aCell)->fontshadow((bool)sh);
}

// Other
-(uint32_t)row
{
	return CELL(aCell)->GetRow();
}
-(uint32_t)column
{
	return CELL(aCell)->GetCol();
}
-(void)setExtendedFormat:(DHExtendedFormat *)extFmt
{
	CELL(aCell)->SetXF((xf_t *)[extFmt extendedFormat]);
}
-(DHExtendedFormat *)extendedFormat
{
	DHExtendedFormat	*extFmt;
	xf_t				*fmt;
	
	fmt = CELL(aCell)->GetXF();
	
	extFmt = [[DHExtendedFormat alloc] initWithExtendedFormat:fmt];
	
	return extFmt;
}

@end
