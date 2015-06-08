//
//  JXLSFormat.h
//  JXLS
//
//  Created by David Hoerl on 10/7/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

@interface JXLSFormat : NSObject

- (instancetype)initWithFormat:(void *)ft;	// xlslib_core::CFormat *
- (void *)format;

@end
