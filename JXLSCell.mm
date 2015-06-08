//
//  JXLSCell.mm
//  JXLS
//
//  Created by David Hoerl on 10/26/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
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

#import "JXLSCell.h"

#import "JXLSFont.h"
#import "JXLSFormat.h"
#import "JXLSExtendedFormat.h"

#define CELL(a) ((xlslib_core::cell_t *)(a))

@implementation JXLSCell
{
	xlslib_core::cell_t *_cell;
}

- (instancetype)initWithCell:(void *)cl
{
	self = [super init];
	
	_cell = CELL(cl);
	
	return self;
}
- (void *)cell
{
	return _cell;
}

// xf_i interface
- (void)setFont:(JXLSFont *)aFont
{
	_cell->font((font_t *)[aFont font]);
}
- (void)setHorizontalAlignment:(halign_option_t)ha_option
{
	_cell->halign(ha_option);
}
- (void)setVerticalAlignment:(valign_option_t)va_option
{
	_cell->valign(va_option);
}
- (void)setIndentation:(indent_option_t)indent_option
{
	_cell->indent(indent_option);
}
- (void)setOrientation:(txtori_option_t)ori_option
{
	_cell->orientation(ori_option);
}
- (void)setForegroundFillColor:(color_name_t)color
{
	_cell->fillfgcolor(color);
}
- (void)setBackgroundFillColor:(color_name_t)color
{
	_cell->fillbgcolor(color);
}

- (void)setBackgroundFillColorIndex:(unsigned8_t)color {
    _cell->fillbgcolor(color);
}
- (void)setForegroundFillColorIndex:(unsigned8_t)color {
    _cell->fillfgcolor(color);
}


- (void)setFillStyle:(fill_option_t)fill
{
	_cell->fillstyle(fill);
}
- (void)setLocked:(BOOL)locked_opt
{
	_cell->locked((bool)locked_opt);
}
- (void)setHidden:(BOOL)hidden_opt
{
	_cell->hidden((bool)hidden_opt);
}
- (void)setWraps:(BOOL)wrap_opt
{
	_cell->wrap((bool)wrap_opt);
}
- (void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	_cell->borderstyle(side, style);
}
- (void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	_cell->bordercolor(side, color);
}
- (void)setBorderColorIndex:(unsigned8_t)color forSide:(border_side_t)side
{
    _cell->bordercolor(side, color);
}

//font_i interface
- (void)setFontName:(NSString *)name
{
	_cell->fontname([name cStringUsingEncoding:NSASCIIStringEncoding]);
}
- (void)setFontHeight:(uint16_t)fntheight
{
	_cell->fontheight((unsigned16_t)fntheight);
}
- (void)setFontBold:(boldness_option_t)fntboldness
{
	_cell->fontbold(fntboldness);
}
- (void)setFontUnderline:(underline_option_t)fntunderline
{
	_cell->fontunderline(fntunderline);
}
- (void)setFontScript:(script_option_t)fntscript
{
	_cell->fontscript(fntscript);
}
- (void)setFontColor:(color_name_t)fntcolor
{
	_cell->fontcolor(fntcolor);
}
- (void)setFontColorIndex:(unsigned8_t)fntcolor
{
    _cell->fontcolor(fntcolor);
}

- (void)setFontItalic:(BOOL)italic
{
	_cell->fontitalic((bool)italic);
}
- (void)setFontStrikeout:(BOOL)so
{
	_cell->fontstrikeout((bool)so);
}
- (void)setFontOutline:(BOOL)ol
{
	_cell->fontoutline((bool)ol);
}
- (void)setFontShadow:(BOOL)sh
{
	_cell->fontshadow((bool)sh);
}

// Other
- (uint32_t)row
{
	return _cell->GetRow();
}
- (uint32_t)column
{
	return _cell->GetCol();
}
- (void)setExtendedFormat:(JXLSExtendedFormat *)extFmt
{
	_cell->SetXF((xf_t *)[extFmt extendedFormat]);
}
- (JXLSExtendedFormat *)extendedFormat
{
	JXLSExtendedFormat	*extFmt;
	xf_t				*fmt;
	
	fmt = _cell->GetXF();
	
	extFmt = [[JXLSExtendedFormat alloc] initWithExtendedFormat:fmt];
	
	return extFmt;
}

@end
