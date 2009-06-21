//
//  DHCell.h
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

@class DHFont;
@class DHExtendedFormat;

@interface DHCell : NSObject {
	void	*aCell;
}
-(id)initWithCell:(void *)cl;
-(void *)cell;

-(void)font:(DHFont *)aFont;
-(void)horzAlign:(halign_option_t)ha_option;
-(void)vertAlign:(valign_option_t)va_option;

// xf_i interface
-(void)indent:(indent_option_t)indent_option;
-(void)orientation:(txtori_option_t)ori_option;
-(void)fillFGcolor:(color_name_t)color;
-(void)fillBGcolor:(color_name_t)color;
-(void)fillStyle:(fill_option_t)fill;
-(void)locked:(BOOL)locked_opt;
-(void)locked:(BOOL)locked_opt;
-(void)hidden:(BOOL)hidden_opt;
-(void)wrap:(BOOL)wrap_opt;
-(void)borderStyle:(border_side_t)side style:(border_style_t)style;
-(void)borderColor:(border_side_t)side color:(color_name_t)color;

//font_i interface
-(void)fontName:(NSString *)name;
-(void)fontHeight:(unsigned short)fntheight;
-(void)fontBold:(boldness_option_t)fntboldness;
-(void)fontUnderline:(underline_option_t)fntunderline;
-(void)fontColor:(color_name_t)fntcolor;
-(void)fontItalic:(BOOL)italic;
-(void)fontStrikeout:(BOOL)so;
-(void)fontOutline:(BOOL)ol;
-(void)fontShadow:(BOOL)sh;

// Other
-(unsigned short)row;
-(unsigned short)col;
-(void)setExtendedFormat:(DHExtendedFormat *)extFmt;
-(DHExtendedFormat *)extendedFormat;

@end
