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
	void	*_cell;
}

-(instancetype)initWithCell:(void *)cl
{
	self = [super init];
	
	_cell = cl;
	
	return self;
}
-(void *)cell
{
	return _cell;
}

// xf_i interface
-(void)setFont:(DHFont *)aFont
{
	CELL(_cell)->font((font_t *)[aFont font]);
}
-(void)setHorizontalAlignment:(halign_option_t)ha_option
{
	CELL(_cell)->halign(ha_option);
}
-(void)setVerticalAlignment:(valign_option_t)va_option
{
	CELL(_cell)->valign(va_option);
}
-(void)setIndentation:(indent_option_t)indent_option
{
	CELL(_cell)->indent(indent_option);
}
-(void)setOrientation:(txtori_option_t)ori_option
{
	CELL(_cell)->orientation(ori_option);
}
-(void)setForegroundFillColor:(color_name_t)color
{
	CELL(_cell)->fillfgcolor(color);
}
-(void)setBackgroundFillColor:(color_name_t)color
{
	CELL(_cell)->fillbgcolor(color);
}
-(void)setFillStyle:(fill_option_t)fill
{
	CELL(_cell)->fillstyle(fill);
}
-(void)setLocked:(BOOL)locked_opt
{
	CELL(_cell)->locked((bool)locked_opt);
}
-(void)setHidden:(BOOL)hidden_opt
{
	CELL(_cell)->hidden((bool)hidden_opt);
}
-(void)setWraps:(BOOL)wrap_opt
{
	CELL(_cell)->wrap((bool)wrap_opt);
}
-(void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	CELL(_cell)->borderstyle(side, style);
}
-(void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	CELL(_cell)->bordercolor(side, color);
}

//font_i interface
-(void)setFontName:(NSString *)name
{
	CELL(_cell)->fontname([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
-(void)setFontHeight:(uint16_t)fntheight
{
	CELL(_cell)->fontheight((unsigned16_t)fntheight);
}
-(void)setFontBold:(boldness_option_t)fntboldness
{
	CELL(_cell)->fontbold(fntboldness);
}
-(void)setFontUnderline:(underline_option_t)fntunderline
{
	CELL(_cell)->fontunderline(fntunderline);
}
-(void)setFontScript:(script_option_t)fntscript
{
	CELL(_cell)->fontscript(fntscript);
}
-(void)setFontColor:(color_name_t)fntcolor
{
	CELL(_cell)->fontcolor(fntcolor);
}
-(void)setFontItalic:(BOOL)italic
{
	CELL(_cell)->fontitalic((bool)italic);
}
-(void)setFontStrikeout:(BOOL)so
{
	CELL(_cell)->fontstrikeout((bool)so);
}
-(void)setFontOutline:(BOOL)ol
{
	CELL(_cell)->fontoutline((bool)ol);
}
-(void)setFontShadow:(BOOL)sh
{
	CELL(_cell)->fontshadow((bool)sh);
}

// Other
-(uint32_t)row
{
	return CELL(_cell)->GetRow();
}
-(uint32_t)column
{
	return CELL(_cell)->GetCol();
}
-(void)setExtendedFormat:(DHExtendedFormat *)extFmt
{
	CELL(_cell)->SetXF((xf_t *)[extFmt extendedFormat]);
}
-(DHExtendedFormat *)extendedFormat
{
	DHExtendedFormat	*extFmt;
	xf_t				*fmt;
	
	fmt = CELL(_cell)->GetXF();
	
	extFmt = [[DHExtendedFormat alloc] initWithExtendedFormat:fmt];
	
	return extFmt;
}

@end
