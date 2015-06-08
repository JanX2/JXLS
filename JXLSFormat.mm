//
//  JXLSFormat.m
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
#import "format.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "JXLSFormat.h"

#define FORMAT(a) ((xlslib_core::format_t *)(a))

@implementation JXLSFormat
{
	xlslib_core::format_t *_format;
}

- (instancetype)initWithFormat:(void *)ft
{
	self = [super init];
	
	_format = FORMAT(ft);
	
	return self;
}
- (void *)format
{
	return _format;
}

@end
