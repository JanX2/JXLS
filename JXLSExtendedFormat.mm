//
//  JXLSExtendedFormat.m
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
#import "extformat.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "JXLSExtendedFormat.h"
#import "JXLSFont.h"

#define FORMAT(a) ((xlslib_core::xf_t *)(a))

@implementation JXLSExtendedFormat
{
	xlslib_core::xf_t *_extFormat;
}

+(JXLSExtendedFormat *)formatWithFormat:(JXLSExtendedFormat *)aFormat
{
	xf_t	*xf;
	
	xf = xf_t::xfDup((xf_t *)aFormat->_extFormat);
	
	return [[JXLSExtendedFormat alloc] initWithExtendedFormat:xf];
}

- (instancetype)initWithExtendedFormat:(void *)xft
{
	self = [super init];
	
	_extFormat = ((xlslib_core::xf_t *)(xft));
	
	return self;
}
- (void *)extendedFormat
{
	return _extFormat;
}

- (void)setFont:(JXLSFont *)font
{
	_extFormat->SetFont((font_t *)[font font]);
}
- (JXLSFont *)font
{
	font_t *fidx;
	
	fidx = _extFormat->GetFont();
	
	return [[JXLSFont alloc] initWithFont:fidx];
}
- (void)setFormatBuiltin:(format_number_t)formatidx
{
	_extFormat->SetFormat(formatidx);
}
- (void)setFormat:(format_t *)fmt
{
	_extFormat->SetFormat((format_t *)fmt);
}
- (void)setHorizontalAlignment:(halign_option_t)ha_option
{
	_extFormat->SetHAlign(ha_option);
}
- (uint8_t)horizontalAlignment
{
	return _extFormat->GetHAlign();

}
- (void)setVerticalAlignment:(valign_option_t)va_option
{
	_extFormat->SetVAlign(va_option);
}
- (uint8_t)verticalAlignment
{
	return _extFormat->GetVAlign();

}
- (void)setIndentation:(indent_option_t)indent_option
{
	_extFormat->SetIndent(indent_option);
}
- (uint8_t)indentation
{
	return _extFormat->GetIndent();

}
- (void)setTextOrientation:(txtori_option_t)ori_option
{
	_extFormat->SetTxtOrientation(ori_option);
}
- (uint8_t)textOrientation
{
	return _extFormat->GetTxtOrientation();

}
- (void)setForegroundFillColor:(color_name_t)color
{
	_extFormat->SetFillFGColor(color);
}

- (void)setForegroundFillColorIndex:(unsigned8_t)color
{
    _extFormat->SetFillFGColor(color);
}

- (uint8_t)foregroundFillColor
{
	return _extFormat->GetFillFGColorIdx();

}
- (void)setBackgroundFillColor:(color_name_t)color
{
	_extFormat->SetFillBGColor(color);
}
- (void)setBackgroundFillColorIndex:(unsigned8_t)color
{
    _extFormat->SetFillBGColor(color);
}
- (uint8_t)backgroundFillColor
{
	return _extFormat->GetFillBGColorIdx();

}
- (void)setFillStyle:(fill_option_t)fill
{
	_extFormat->SetFillStyle(fill);
}
- (uint8_t)fillStyle
{
	return _extFormat->GetFillStyle();

}
- (void)setLocked:(BOOL)locked_opt
{
	_extFormat->SetLocked((bool)locked_opt);
}
- (BOOL)locked
{
	return (BOOL)_extFormat->IsLocked();
}
- (void)setHidden:(BOOL)hidden_opt
{
	_extFormat->SetHidden((bool)hidden_opt);
}
- (BOOL)hidden
{
	return (BOOL)_extFormat->IsHidden();
}
- (void)setWraps:(BOOL)wrap_opt
{
	_extFormat->SetWrap((bool)wrap_opt);
}
- (BOOL)wrap
{
	return (BOOL)_extFormat->IsWrap();
}
- (void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	_extFormat->SetBorderStyle(side, style);
}
- (void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	_extFormat->SetBorderColor(side, color);
}
- (void)setBorderColorIndex:(unsigned8_t)color forSide:(border_side_t)side
{
    _extFormat->SetBorderColor(side, color);
}
- (void)borderStyle:(border_side_t)side
{
	_extFormat->GetBorderStyle(side);
}

@end
