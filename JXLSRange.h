//
//  JXLSRange.h
//  JXLS
//
//  Created by David Hoerl on 10/26/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

@interface JXLSRange : NSObject

- (id)initWithRange:(void *)rg;	// xlslib_core::range *
- (void *)range;

- (void)cellColor:(color_name_t)aColor;

@end
