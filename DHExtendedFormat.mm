//
//  DHExtendedFormat.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "extformat.h"
#endif

using namespace std;
using namespace xlslib_core;

#import "DHExtendedFormat.h"
#import "DHFont.h"

#define FORMAT(a) ((xlslib_core::xf_t *)(a))

@implementation DHExtendedFormat
+(DHExtendedFormat *)formatWithFormat:(DHExtendedFormat *)aFormat
{
	xf_t	*xf;
	
	xf = xf_t::xfDup((xf_t *)aFormat->aExtFormat);
	
	return [[[DHExtendedFormat alloc] initWithExtFormat:xf] autorelease];
}

-(id)initWithExtFormat:(void *)xft
{
	self = [super init];
	
	aExtFormat = xft;
	
	return self;
}
-(void *)extFormat
{
	return aExtFormat;
}

-(void)setFont:(DHFont *)fontidx
{
	 FORMAT(aExtFormat)->SetFont((font_t *)[fontidx font]);
}
-(DHFont *)font
{
	font_t *fidx;
	
	fidx = FORMAT(aExtFormat)->GetFont();
	
	return [[[DHFont alloc] initWithFont:fidx] autorelease];
}
-(void)setFormatBuiltin:(format_number_t)formatidx
{
	 FORMAT(aExtFormat)->SetFormat(formatidx);
}
-(void)setFormat:(format_t *)fmt
{
	 FORMAT(aExtFormat)->SetFormat((format_t *)fmt);
}
-(void)setHAlign:(halign_option_t)ha_option
{
	 FORMAT(aExtFormat)->SetHAlign(ha_option);
}
-(unsigned char)hAlign
{
	return FORMAT(aExtFormat)->GetHAlign();

}
-(void)setVAlign:(valign_option_t)va_option
{
	 FORMAT(aExtFormat)->SetVAlign(va_option);
}
-(unsigned char)vAlign
{
	return FORMAT(aExtFormat)->GetVAlign();

}
-(void)setIndent:(indent_option_t)indent_option
{
	 FORMAT(aExtFormat)->SetIndent(indent_option);
}
-(unsigned char)indent
{
	return FORMAT(aExtFormat)->GetIndent();

}
-(void)setTxtOrientation:(txtori_option_t)ori_option
{
	 FORMAT(aExtFormat)->SetTxtOrientation(ori_option);
}
-(unsigned char)txtOrientation
{
	return FORMAT(aExtFormat)->GetTxtOrientation();

}
-(void)setFillFGColor:(color_name_t)color
{
	 FORMAT(aExtFormat)->SetFillFGColor(color);
}
-(unsigned char)fillFGColor
{
	return FORMAT(aExtFormat)->GetFillFGColorIdx();

}
-(void)setFillBGColor:(color_name_t)color
{
	 FORMAT(aExtFormat)->SetFillBGColor(color);
}
-(unsigned char)fillBGColor
{
	return FORMAT(aExtFormat)->GetFillBGColorIdx();

}
-(void)setFillStyle:(fill_option_t)fill
{
	 FORMAT(aExtFormat)->SetFillStyle(fill);
}
-(unsigned char)fillStyle
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
-(void)setWrap:(BOOL)wrap_opt
{
	 FORMAT(aExtFormat)->SetWrap((bool)wrap_opt);
}
-(BOOL)wrap
{
	return (BOOL)FORMAT(aExtFormat)->IsWrap();
}
-(void)setBorderStyle:(border_side_t)side style:(border_style_t)style
{
	FORMAT(aExtFormat)->SetBorderStyle(side, style);
}
-(void)setBorderColor:(border_side_t)side color:(color_name_t)color
{
	FORMAT(aExtFormat)->SetBorderColor(side, color);
}
-(void)borderStyle:(border_side_t)side
{
	FORMAT(aExtFormat)->GetBorderStyle(side);
}



@end
