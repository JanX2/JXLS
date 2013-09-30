//
//  DHCell.h
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

@class DHFont;
@class DHExtendedFormat;

@interface DHCell : NSObject

-(instancetype)initWithCell:(void *)cl;
-(void *)cell;

-(void)setFont:(DHFont *)aFont;
-(void)setHorizontalAlignment:(halign_option_t)ha_option;
-(void)setVerticalAlignment:(valign_option_t)va_option;

// xf_i interface
-(void)setIndentation:(indent_option_t)indent_option;
-(void)setOrientation:(txtori_option_t)ori_option;
-(void)setForegroundFillColor:(color_name_t)color;
-(void)setBackgroundFillColor:(color_name_t)color;
-(void)setFillStyle:(fill_option_t)fill;
-(void)setLocked:(BOOL)locked_opt;
-(void)setHidden:(BOOL)hidden_opt;
-(void)setWraps:(BOOL)wrap_opt;
-(void)setBorderStyle:(border_style_t)style forSide:(border_side_t)side;
-(void)setBorderColor:(color_name_t)color forSide:(border_side_t)side;

//font_i interface
-(void)setFontName:(NSString *)name;
-(void)setFontHeight:(unsigned short)fntheight;
-(void)setFontBold:(boldness_option_t)fntboldness;
-(void)setFontUnderline:(underline_option_t)fntunderline;
-(void)setFontColor:(color_name_t)fntcolor;
-(void)setFontItalic:(BOOL)italic;
-(void)setFontStrikeout:(BOOL)so;
-(void)setFontOutline:(BOOL)ol;
-(void)setFontShadow:(BOOL)sh;

// Other
-(uint32_t)row;
-(uint32_t)column;
-(void)setExtendedFormat:(DHExtendedFormat *)extFmt;
-(DHExtendedFormat *)extendedFormat;

@end
