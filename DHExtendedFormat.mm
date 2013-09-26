//
//  DHExtendedFormat.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "extformat.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "DHExtendedFormat.h"
#import "DHFont.h"

#define FORMAT(a) ((xlslib_core::xf_t *)(a))

@implementation DHExtendedFormat
{
	void		*_extFormat;		// xlslib_core::CExtFormat
}

+(DHExtendedFormat *)formatWithFormat:(DHExtendedFormat *)aFormat
{
	xf_t	*xf;
	
	xf = xf_t::xfDup((xf_t *)aFormat->_extFormat);
	
	return [[DHExtendedFormat alloc] initWithExtendedFormat:xf];
}

-(instancetype)initWithExtendedFormat:(void *)xft
{
	self = [super init];
	
	_extFormat = xft;
	
	return self;
}
-(void *)extendedFormat
{
	return _extFormat;
}

-(void)setFont:(DHFont *)font
{
	 FORMAT(_extFormat)->SetFont((font_t *)[font font]);
}
-(DHFont *)font
{
	font_t *fidx;
	
	fidx = FORMAT(_extFormat)->GetFont();
	
	return [[DHFont alloc] initWithFont:fidx];
}
-(void)setFormatBuiltin:(format_number_t)formatidx
{
	 FORMAT(_extFormat)->SetFormat(formatidx);
}
-(void)setFormat:(format_t *)fmt
{
	 FORMAT(_extFormat)->SetFormat((format_t *)fmt);
}
-(void)setHorizontalAlignment:(halign_option_t)ha_option
{
	 FORMAT(_extFormat)->SetHAlign(ha_option);
}
-(uint8_t)horizontalAlignment
{
	return FORMAT(_extFormat)->GetHAlign();

}
-(void)setVerticalAlignment:(valign_option_t)va_option
{
	 FORMAT(_extFormat)->SetVAlign(va_option);
}
-(uint8_t)verticalAlignment
{
	return FORMAT(_extFormat)->GetVAlign();

}
-(void)setIndentation:(indent_option_t)indent_option
{
	 FORMAT(_extFormat)->SetIndent(indent_option);
}
-(uint8_t)indentation
{
	return FORMAT(_extFormat)->GetIndent();

}
-(void)setTextOrientation:(txtori_option_t)ori_option
{
	 FORMAT(_extFormat)->SetTxtOrientation(ori_option);
}
-(uint8_t)textOrientation
{
	return FORMAT(_extFormat)->GetTxtOrientation();

}
-(void)setForegroundFillColor:(color_name_t)color
{
	 FORMAT(_extFormat)->SetFillFGColor(color);
}
-(uint8_t)foregroundFillColor
{
	return FORMAT(_extFormat)->GetFillFGColorIdx();

}
-(void)setBackgroundFillColor:(color_name_t)color
{
	 FORMAT(_extFormat)->SetFillBGColor(color);
}
-(uint8_t)backgroundFillColor
{
	return FORMAT(_extFormat)->GetFillBGColorIdx();

}
-(void)setFillStyle:(fill_option_t)fill
{
	 FORMAT(_extFormat)->SetFillStyle(fill);
}
-(uint8_t)fillStyle
{
	return FORMAT(_extFormat)->GetFillStyle();

}
-(void)setLocked:(BOOL)locked_opt
{
	 FORMAT(_extFormat)->SetLocked((bool)locked_opt);
}
-(BOOL)locked
{
	return (BOOL)FORMAT(_extFormat)->IsLocked();
}
-(void)setHidden:(BOOL)hidden_opt
{
	 FORMAT(_extFormat)->SetHidden((bool)hidden_opt);
}
-(BOOL)hidden
{
	return (BOOL)FORMAT(_extFormat)->IsHidden();
}
-(void)setWraps:(BOOL)wrap_opt
{
	 FORMAT(_extFormat)->SetWrap((bool)wrap_opt);
}
-(BOOL)wrap
{
	return (BOOL)FORMAT(_extFormat)->IsWrap();
}
-(void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	FORMAT(_extFormat)->SetBorderStyle(side, style);
}
-(void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	FORMAT(_extFormat)->SetBorderColor(side, color);
}
-(void)borderStyle:(border_side_t)side
{
	FORMAT(_extFormat)->GetBorderStyle(side);
}

@end
