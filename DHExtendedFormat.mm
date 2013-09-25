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
	void		*aExtFormat;		// xlslib_core::CExtFormat
}

+(DHExtendedFormat *)formatWithFormat:(DHExtendedFormat *)aFormat
{
	xf_t	*xf;
	
	xf = xf_t::xfDup((xf_t *)aFormat->aExtFormat);
	
	return [[DHExtendedFormat alloc] initWithExtendedFormat:xf];
}

-(instancetype)initWithExtendedFormat:(void *)xft
{
	self = [super init];
	
	aExtFormat = xft;
	
	return self;
}
-(void *)extendedFormat
{
	return aExtFormat;
}

-(void)setFont:(DHFont *)font
{
	 FORMAT(aExtFormat)->SetFont((font_t *)[font font]);
}
-(DHFont *)font
{
	font_t *fidx;
	
	fidx = FORMAT(aExtFormat)->GetFont();
	
	return [[DHFont alloc] initWithFont:fidx];
}
-(void)setFormatBuiltin:(format_number_t)formatidx
{
	 FORMAT(aExtFormat)->SetFormat(formatidx);
}
-(void)setFormat:(format_t *)fmt
{
	 FORMAT(aExtFormat)->SetFormat((format_t *)fmt);
}
-(void)setHorizontalAlignment:(halign_option_t)ha_option
{
	 FORMAT(aExtFormat)->SetHAlign(ha_option);
}
-(uint8_t)horizontalAlignment
{
	return FORMAT(aExtFormat)->GetHAlign();

}
-(void)setVerticalAlignment:(valign_option_t)va_option
{
	 FORMAT(aExtFormat)->SetVAlign(va_option);
}
-(uint8_t)verticalAlignment
{
	return FORMAT(aExtFormat)->GetVAlign();

}
-(void)setIndentation:(indent_option_t)indent_option
{
	 FORMAT(aExtFormat)->SetIndent(indent_option);
}
-(uint8_t)indentation
{
	return FORMAT(aExtFormat)->GetIndent();

}
-(void)setTextOrientation:(txtori_option_t)ori_option
{
	 FORMAT(aExtFormat)->SetTxtOrientation(ori_option);
}
-(uint8_t)textOrientation
{
	return FORMAT(aExtFormat)->GetTxtOrientation();

}
-(void)setForegroundFillColor:(color_name_t)color
{
	 FORMAT(aExtFormat)->SetFillFGColor(color);
}
-(uint8_t)foregroundFillColor
{
	return FORMAT(aExtFormat)->GetFillFGColorIdx();

}
-(void)setBackgroundFillColor:(color_name_t)color
{
	 FORMAT(aExtFormat)->SetFillBGColor(color);
}
-(uint8_t)backgroundFillColor
{
	return FORMAT(aExtFormat)->GetFillBGColorIdx();

}
-(void)setFillStyle:(fill_option_t)fill
{
	 FORMAT(aExtFormat)->SetFillStyle(fill);
}
-(uint8_t)fillStyle
{
	return FORMAT(aExtFormat)->GetFillStyle();

}
-(void)setLocked:(BOOL)locked_opt
{
	 FORMAT(aExtFormat)->SetLocked((bool)locked_opt);
}
-(BOOL)locked
{
	return (BOOL)FORMAT(aExtFormat)->IsLocked();
}
-(void)setHidden:(BOOL)hidden_opt
{
	 FORMAT(aExtFormat)->SetHidden((bool)hidden_opt);
}
-(BOOL)hidden
{
	return (BOOL)FORMAT(aExtFormat)->IsHidden();
}
-(void)setWraps:(BOOL)wrap_opt
{
	 FORMAT(aExtFormat)->SetWrap((bool)wrap_opt);
}
-(BOOL)wrap
{
	return (BOOL)FORMAT(aExtFormat)->IsWrap();
}
-(void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side
{
	FORMAT(aExtFormat)->SetBorderStyle(side, style);
}
-(void)setBorderColor:(color_name_t)color forSide:(border_side_t)side
{
	FORMAT(aExtFormat)->SetBorderColor(side, color);
}
-(void)borderStyle:(border_side_t)side
{
	FORMAT(aExtFormat)->GetBorderStyle(side);
}

@end
