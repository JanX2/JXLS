//
//  DHExtendedFormat.h
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

@class DHFont;	// NSCopying

@interface DHExtendedFormat : NSObject {
	void		*aExtFormat;		// xlslib_core::CExtFormat
}
+(DHExtendedFormat *)formatWithFormat:(DHExtendedFormat *)aFormat;

-(id)initWithExtFormat:(void *)xft;	// xlslib_core::CExtFormat *
-(void *)extFormat;

-(void)setFont:(DHFont *)fontidx;
-(DHFont *)font;


-(void)setFormatBuiltin:(format_number_t)formatidx;
-(void)setFormat:(format_t *)fmt;
-(void)setHAlign:(halign_option_t)ha_option;
-(unsigned char)hAlign;
-(void)setVAlign:(valign_option_t)va_option;
-(unsigned char)vAlign;
-(void)setIndent:(indent_option_t)indent_option;
-(unsigned char)indent;
-(void)setTxtOrientation:(txtori_option_t)ori_option;
-(unsigned char)txtOrientation;
-(void)setFillFGColor:(color_name_t)color;
-(unsigned char)fillFGColor;
-(void)setFillBGColor:(color_name_t)color;
-(unsigned char)fillBGColor;
-(void)setFillStyle:(fill_option_t)fill;
-(unsigned char)fillStyle;
-(void)setLocked:(BOOL)locked_opt;
-(BOOL)locked;
-(void)setHidden:(BOOL)hidden_opt;
-(BOOL)hidden;
-(void)setWrap:(BOOL)wrap_opt;
-(BOOL)hidden;
-(void)setBorderStyle:(border_side_t)side style:(border_style_t)style;
-(void)setBorderColor:(border_side_t)side color:(color_name_t)color;
-(void)borderStyle:(border_side_t)side;

@end
