//
//  DHCell.mm
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "cell.h"
#import "format.h"
#import "extformat.h"
#endif

using namespace std;
using namespace xlslib_core;

#import "DHCell.h"

#import "DHFont.h"
#import "DHFormat.h"
#import "DHExtendedFormat.h"

#define CELL(a) ((xlslib_core::cell_t *)(a))

@implementation DHCell
-(id)initWithCell:(void *)cl
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
-(void)font:(DHFont *)aFont
{
	CELL(aCell)->font((font_t *)[aFont font]);
}
-(void)horzAlign:(halign_option_t)ha_option
{
	CELL(aCell)->halign(ha_option);
}
-(void)vertAlign:(valign_option_t)va_option
{
	CELL(aCell)->valign(va_option);
}
-(void)indent:(indent_option_t)indent_option
{
	CELL(aCell)->indent(indent_option);
}
-(void)orientation:(txtori_option_t)ori_option
{
	CELL(aCell)->orientation(ori_option);
}
-(void)fillFGcolor:(color_name_t)color
{
	CELL(aCell)->fillfgcolor(color);
}
-(void)fillBGcolor:(color_name_t)color
{
	CELL(aCell)->fillbgcolor(color);
}
-(void)fillStyle:(fill_option_t)fill
{
	CELL(aCell)->fillstyle(fill);
}
-(void)locked:(BOOL)locked_opt
{
	CELL(aCell)->locked((bool)locked_opt);
}
-(void)hidden:(BOOL)hidden_opt
{
	CELL(aCell)->hidden((bool)hidden_opt);
}
-(void)wrap:(BOOL)wrap_opt
{
	CELL(aCell)->wrap((bool)wrap_opt);
}
-(void)borderStyle:(border_side_t)side style:(border_style_t)style
{
	CELL(aCell)->borderstyle(side, style);
}
-(void)borderColor:(border_side_t)side color:(color_name_t)color
{
	CELL(aCell)->bordercolor(side, color);
}

//font_i interface
-(void)fontName:(NSString *)name
{
	CELL(aCell)->fontname([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
-(void)fontHeight:(unsigned short)fntheight
{
	CELL(aCell)->fontheight((unsigned16_t)fntheight);
}
-(void)fontBold:(boldness_option_t)fntboldness
{
	CELL(aCell)->fontbold(fntboldness);
}
-(void)fontUnderline:(underline_option_t)fntunderline
{
	CELL(aCell)->fontunderline(fntunderline);
}
-(void)fontScript:(script_option_t)fntscript
{
	CELL(aCell)->fontscript(fntscript);
}
-(void)fontColor:(color_name_t)fntcolor
{
	CELL(aCell)->fontcolor(fntcolor);
}
-(void)fontItalic:(BOOL)italic
{
	CELL(aCell)->fontitalic((bool)italic);
}
-(void)fontStrikeout:(BOOL)so
{
	CELL(aCell)->fontstrikeout((bool)so);
}
-(void)fontOutline:(BOOL)ol
{
	CELL(aCell)->fontoutline((bool)ol);
}
-(void)fontShadow:(BOOL)sh
{
	CELL(aCell)->fontshadow((bool)sh);
}

// Other
-(unsigned short)row
{
	return CELL(aCell)->GetRow();
}
-(unsigned short)col
{
	return CELL(aCell)->GetCol();
}
-(void)setExtendedFormat:(DHExtendedFormat *)extFmt
{
	CELL(aCell)->SetXF((xf_t *)[extFmt extFormat]);
}
-(DHExtendedFormat *)extendedFormat
{
	DHExtendedFormat	*extFmt;
	xf_t				*fmt;
	
	fmt = CELL(aCell)->GetXF();
	
	extFmt = [[[DHExtendedFormat alloc] initWithExtFormat:extFmt] autorelease];
	
	return extFmt;
}

@end
