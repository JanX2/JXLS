//
//  DHFormat.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "format.h"
#endif

using namespace xlslib_core;
using namespace xlslib_strings;

#import "DHFormat.h"

#define FORMAT(a) ((xlslib_core::format_t *)(a))

@implementation DHFormat
{
	xlslib_core::format_t *_format;
}

-(instancetype)initWithFormat:(void *)ft
{
	self = [super init];
	
	_format = FORMAT(ft);
	
	return self;
}
-(void *)format
{
	return _format;
}

@end
